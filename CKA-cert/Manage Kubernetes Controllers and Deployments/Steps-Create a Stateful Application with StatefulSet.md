

1
First, create a namespace for this challenge with the kubectl create ns challenge5 command and then switch the context to the new namespace: kubectl config set-context --current --namespace=challenge5



2
Check the provided definition: cat ~/challenges/05/service.yml

The defined Service is called redis. The Service is headless as it has clusterIP: None, which prevents the service from having an IP, and therefore clients will not be able to connect directly to the Pods behind it.


3

Create the service: kubectl apply -f ~/challenges/05/service.yml

Ensure the service has been created: kubectl get service

You should see the redis-service resource created.


4
Depending on the role (redis master or redis replica), each of the Pods forming your StatefulSet will require a specific configuration. You will create a ConfigMap resource to store both configurations, and then add the required config as part of an initContainer. Check the provided definition: cat ~/challenges/05/configmap.yml

Note: Under replica.conf you define the master address, in this case the master name is redis-ss-0. You will ensure the master's name is always redis-ss-0 by using the StatefulSet controller. The replicas will be redis-ss-1, redis-ss-2, etc.


5
Create the ConfigMap (kubectl apply -f ~/challenges/05/configmap.yml) and ensure it has been created (kubectl get cm).


6
Check the provided definition: cat ~/challenges/05/statefulset.yml

It defines a StatefulSet formed by three replicas, each replica will run a single container running the redis:7.0 image. Note there is also a initContainer which copies the required configuration file (from the ConfigMap resource deployed in the previous task) based on the name of the host:

If the hostname ends in 0, it copies the master's configuration
otherwise, it copies the redis replica's configuration.

7
Install the StatefulSet by running the kubectl apply -f ~/challenges/05/statefulset.yml command.

8
Ensure there are three pods running and the names are consistent (ending in 0, 1, and 2): kubectl get pods


9
Connect to each of the pods and ensure their role is the expected one (redis #0 should be master, the other two redis replicas):

 kubectl exec -it redis-ss-0 -c redis -- redis-cli info | grep master_host
No master host is output, as expected since this is the master

 kubectl exec -it redis-ss-1 -c redis -- redis-cli info | grep master_host
The master host is output, indicating this is a replica.

 kubectl exec -it redis-ss-2 -c redis -- redis-cli info | grep master_host
This too is a replica as it has a master host.


10
Ensure the replication across the cluster works: - Store a new key/value pair by connecting to the master node:
   ```
   kubectl exec -it redis-ss-0 -c redis -- redis-cli set msg "Hello PluralSight!"
   ```
- Ensure the both redis replicas can retrieve the value of the msg key:
   
   
   ```
   kubectl exec -it redis-ss-1 -c redis -- redis-cli get msg
   ```
   
   `` kubectl exec -it redis-ss-2 -c redis -- redis-cli get msg ``
   ![](https://labs.pluralsight.com/labkeep/lab_assets/d7b07a5d-894e-4591-bf4c-a25292b631ee)

Awesome! You have your redis cluster up and running, including the replication. In the next challenge you will use the Job and CronJob controllers to automate and schedule repetitive tasks.





```bash
slearner@ip-172-31-24-113:~$ kubectl create ns challenge5
namespace/challenge5 created
pslearner@ip-172-31-24-113:~$ kubectl config set-context --current --namespace=challenge5
Context "minikube" modified.
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ cat ~/challenges/05/service.yml 
---
apiVersion: v1
kind: Service
metadata:
  name: redis-service
  labels:
    app: redis
spec:
  ports:
    - port: 6379
  clusterIP: None
  selector:
    app: redis
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ kubectl apply -f ~/challenges/05/service.yml 
service/redis-service created
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ kubectl get service
NAME            TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)    AGE
redis-service   ClusterIP   None         <none>        6379/TCP   6s
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ cat ~/challenges/05/configmap.yml 
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: redis-ss-configuration
  labels:
    app: redis
data:
  master.conf: |
    maxmemory 400mb
    maxmemory-policy allkeys-lru
    maxclients 20000
    timeout 300
    appendonly no
    dbfilename dump.rdb
    dir /data
  replica.conf: |
    replicaof redis-ss-0.redis-service.challenge5 6379
    maxmemory 400mb
    maxmemory-policy allkeys-lru
    maxclients 20000
    timeout 300
    dir /data
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ kubectl apply -f ~/challenges/05/configmap.yml

configmap/redis-ss-configuration created
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ kubectl get cm
NAME                     DATA   AGE
kube-root-ca.crt         1      3m26s
redis-ss-configuration   2      11s
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ cat ~/challenges/05/statefulset.yml
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: redis-ss
spec:
  serviceName: "redis-service"
  replicas: 3
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      initContainers:
      - name: init-redis
        image: redis:7.0
        command:
        - bash
        - "-c"
        - |
          set -ex
          # Generate redis server-id from pod ordinal index.
          [[ `hostname` =~ -([0-9]+)$ ]] || exit 1
          ordinal=${BASH_REMATCH[1]}
          # Copy appropriate redis config files from config-map to respective directories.
          if [[ $ordinal -eq 0 ]]; then
            cp /mnt/master.conf /etc/redis-config.conf
          else
            cp /mnt/replica.conf /etc/redis-config.conf
          fi
        volumeMounts:
        - name: redis-claim
          mountPath: /etc
        - name: config-map
          mountPath: /mnt/
      containers:
      - name: redis
        image: redis:7.0
        ports:
        - containerPort: 6379
          name: redis-ss
        command:
          - redis-server
          - "/etc/redis-config.conf"
        volumeMounts:
        - name: redis-data
          mountPath: /data
        - name: redis-claim
          mountPath: /etc
      volumes:
      - name: config-map
        configMap:
          name: redis-ss-configuration                  
  volumeClaimTemplates:
  - metadata:
      name: redis-claim
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
  - metadata:
      name: redis-data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ 
pslearner@ip-172-31-24-113:~$ kubectl apply -f ~/challenges/05/statefulset.yml
statefulset.apps/redis-ss created
pslearner@ip-172-31-24-113:~$ kubectl get pods
NAME         READY   STATUS    RESTARTS   AGE
redis-ss-0   1/1     Running   0          7s
redis-ss-1   1/1     Running   0          4s
redis-ss-2   0/1     Pending   0          0s
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-0 -c redis -- redis-cli info | grep master_host
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-1 -c redis -- redis-cli info | grep master_host
master_host:redis-ss-0.redis-service.challenge5
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-2 -c redis -- redis-cli info | grep master_host
master_host:redis-ss-0.redis-service.challenge5
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-0 -c redis -- redis-cli set msg "Hello PluralSight!"
OK
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-1 -c redis -- redis-cli get msg
"Hello PluralSight!"
pslearner@ip-172-31-24-113:~$ kubectl exec -it redis-ss-2 -c redis -- redis-cli get msg
"Hello PluralSight!"
pslearner@ip-172-31-24-113:~$ 
```


