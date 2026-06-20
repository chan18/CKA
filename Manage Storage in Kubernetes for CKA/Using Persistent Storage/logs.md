
```bash
pslearner@ip-172-31-24-94:~$ status

SYSTEM COMPLETE
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS    RESTARTS       AGE
kube-system   coredns-5d78c9869d-ps4nh                  1/1     Running   1 (3h ago)     3h1m
kube-system   csi-hostpath-attacher-0                   1/1     Running   1 (3h ago)     3h1m
kube-system   csi-hostpath-resizer-0                    1/1     Running   1 (3h ago)     3h1m
kube-system   csi-hostpathplugin-r84xv                  6/6     Running   6 (3h ago)     3h1m
kube-system   etcd-minikube                             1/1     Running   1 (3h ago)     3h2m
kube-system   kube-apiserver-minikube                   1/1     Running   1 (3h ago)     3h2m
kube-system   kube-controller-manager-minikube          1/1     Running   1 (3h ago)     3h2m
kube-system   kube-proxy-xgk2f                          1/1     Running   1 (3h ago)     3h1m
kube-system   kube-scheduler-minikube                   1/1     Running   1 (3h ago)     3h2m
kube-system   nfs-client-provisioner-56b68db895-z2hh7   1/1     Running   0              3h
kube-system   snapshot-controller-75bbb956b9-gtprx      1/1     Running   1 (3h ago)     3h1m
kube-system   snapshot-controller-75bbb956b9-hqvtt      1/1     Running   1 (3h ago)     3h1m
kube-system   storage-provisioner                       1/1     Running   3 (179m ago)   3h2m
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl creates ns challenge2
error: unknown command "creates" for "kubectl"

Did you mean this?
	create
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl create ns challenge2
namespace/challenge2 created
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl config set-context --current --namespace=challenge2
Context "minikube" modified.
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ cat ~/challenges/02/pv.yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: "/mnt/data"
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl apply -f ~/challenges/02/pv.yml


persistentvolume/my-pv created
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl get pv
NAME    CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
my-pv   10Gi       RWO            Retain           Available           manual                  8s
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ cat ~/challenges/02/pvc.yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
  namespace: challenge2
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: manual
  resources:
    requests:
      storage: 1Gi
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl apply -f ~/challenges/02/pvc.yml


persistentvolumeclaim/my-pvc created
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl get pvc
NAME     STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
my-pvc   Bound    my-pv    10Gi       RWO            manual         13s
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ cat ~/challenges/02/deploy.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-awesome-deployment
  namespace: challenge2
spec:
  replicas: 1
  selector:
    matchLabels:
      app: busybox
  template:
    metadata:
      labels:
        app: busybox
    spec:
      containers:
      - name: busybox
        image: busybox:1.36
        imagePullPolicy: IfNotPresent
        command: ["/bin/sh", "-c", "while true; do echo $(date) $(hostname) healthy >> /mnt/data/challenge2.log; sleep 300; done"]
        volumeMounts:
        - name: data-volume
          mountPath: /mnt/data
      volumes:
      - name: data-volume
        persistentVolumeClaim:
          claimName: my-pvc
  
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ ^C
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl apply -f ~/challenges/02/deploy.yml

deployment.apps/my-awesome-deployment created
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
my-awesome-deployment-cbf776685-xmwfz   1/1     Running   0          10s
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl delete pod my-awesome-deployment-cbf776685-xmwfz
pod "my-awesome-deployment-cbf776685-xmwfz" deleted

pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
my-awesome-deployment-cbf776685-kqqnb   1/1     Running   0          71s
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ minikube ssh


docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ tail /mnt/data/challenge2.log
Fri Jun 19 16:56:03 UTC 2026 my-awesome-deployment-cbf776685-xmwfz healthy
Fri Jun 19 16:57:56 UTC 2026 my-awesome-deployment-cbf776685-kqqnb healthy
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ 
docker@minikube:~$ exit
logout
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ 
pslearner@ip-172-31-24-94:~$ ##########
```

