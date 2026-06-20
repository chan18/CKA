

```bash
pslearner@ip-172-31-24-243:~$ kubectl create ns challenge3
namespace/challenge3 created
pslearner@ip-172-31-24-243:~$ kubectl config set-context --current --namespace=challenge3
Context "minikube" modified.
pslearner@ip-172-31-24-243:~$ kubectl get storageclass csi-hostpath-sc
NAME              PROVISIONER           RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
csi-hostpath-sc   hostpath.csi.k8s.io   Delete          Immediate           false                  143m
pslearner@ip-172-31-24-243:~$ cat ~/challenges/83/pvc-hostpath.yml
cat: /home/pslearner/challenges/83/pvc-hostpath.yml: No such file or directory
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pvc-
pvc-hostpath.yml  pvc-nfs.yml       
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pvc-
pvc-hostpath.yml  pvc-nfs.yml       
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pvc-
pvc-hostpath.yml  pvc-nfs.yml       
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pvc-hostpath.yml 
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: hostpath-pvc
  namespace: challenge3
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: csi-hostpath-sc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/03/pvc-hostpath.yml
persistentvolumeclaim/hostpath-pvc created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pvc.pv
error: the server doesn\'t have a resource type "pvc"
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pvc,pv
NAME                                 STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS      AGE
persistentvolumeclaim/hostpath-pvc   Bound    pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            csi-hostpath-sc   21s

NAME                                                        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS      REASON   AGE
persistentvolume/pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            Delete           Bound    challenge3/hostpath-pvc   csi-hostpath-sc            19s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pod-hostpath.yml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-app
  namespace: challenge3
spec:
  containers:
  - name: busybox
    image: busybox:1.36
    imagePullPolicy: IfNotPresent
    command: ["/bin/sh", "-c", "while true; do echo Hello hostPath! > /mnt/data/challenge3-hostpath.log; sleep 3600; done"]
    volumeMounts:
    - mountPath: "/mnt/data"
      name: hostpath-volume
  volumes:
  - name: hostpath-volume
    persistentVolumeClaim:
      claimName: hostpath-pvc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pods
No resources found in challenge3 namespace.
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/03/pod-hostpath.yml 
pod/hostpath-app created
pslearner@ip-172-31-24-243:~$ kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
hostpath-app   1/1     Running   0          3s
pslearner@ip-172-31-24-243:~$ minikube ssh
docker@minikube:~$ cd /avar/lib/csi-hostpath-data
-bash: cd: /avar/lib/csi-hostpath-data: No such file or directory
docker@minikube:~$ cd /var/lib/csi-hostpath-data/
docker@minikube:/var/lib/csi-hostpath-data$ ls
43cc31eb-6c58-11f1-940a-3ad83c57d00c  state.json
docker@minikube:/var/lib/csi-hostpath-data$ ls -i
1322775 43cc31eb-6c58-11f1-940a-3ad83c57d00c  1324319 state.json
docker@minikube:/var/lib/csi-hostpath-data$ ls -l
total 8
drwxr-xr-x 2 root root 4096 Jun 20 04:12 43cc31eb-6c58-11f1-940a-3ad83c57d00c
-rw------- 1 root root  380 Jun 20 03:29 state.json
docker@minikube:/var/lib/csi-hostpath-data$ sudo cat state.json
{"Volumes":[{"VolName":"pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349","VolID":"43cc31eb-6c58-11f1-940a-3ad83c57d00c","VolSize":1073741824,"VolPath":"/csi-data-dir/43cc31eb-6c58-11f1-940a-3ad83c57d00c","VolAccessType":0,"ParentVolID":"","ParentSnapID":"","Ephemeral":false,"NodeID":"","Kind":"","ReadOnlyAttach":false,"Attached":false,"Staged":null,"Published":null}],"Snapshots":null}docker@minikube:/var/lib/csi-hostpath-data$ 
docker@minikube:/var/lib/csi-hostpath-data$ 
docker@minikube:/var/lib/csi-hostpath-data$ 
docker@minikube:/var/lib/csi-hostpath-data$ 
docker@minikube:/var/lib/csi-hostpath-data$ 
docker@minikube:/var/lib/csi-hostpath-data$ cat 43cc31eb-6c58-11f1-940a-3ad83c57d00c/challenge3-hostpath.log
Hello hostPath!
docker@minikube:/var/lib/csi-hostpath-data$ exit
logout
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get storageclass nfs-provisioner
NAME              PROVISIONER                                   RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
nfs-provisioner   k8s-sigs.io/nfs-subdir-external-provisioner   Delete          Immediate           false                  3h13m
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get deploy nfs-client-provisioner -n kube-system -o json | jq '.spec.template.spec.volumes[0]'
{
  "name": "nfs-client-root",
  "nfs": {
    "path": "/export/nfs",
    "server": "192.168.49.1"
  }
}
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pvc-nfs.yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-pvc
  namespace: challenge3
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: nfs-provisioner
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/03/pvc-nfs.yml
persistentvolumeclaim/nfs-pvc created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pvc,pv
NAME                                 STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS      AGE
persistentvolumeclaim/hostpath-pvc   Bound    pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            csi-hostpath-sc   48m
persistentvolumeclaim/nfs-pvc        Bound    pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539   1Gi        RWO            nfs-provisioner   15s

NAME                                                        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS      REASON   AGE
persistentvolume/pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            Delete           Bound    challenge3/hostpath-pvc   csi-hostpath-sc            48m
persistentvolume/pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539   1Gi        RWO            Delete           Bound    challenge3/nfs-pvc        nfs-provisioner            15s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/03/pod-nfs.yml
apiVersion: v1
kind: Pod
metadata:
  name: nfs-app
  namespace: challenge3
spec:
  containers:
  - name: busybox
    image: busybox:1.36
    imagePullPolicy: IfNotPresent
    command: ["/bin/sh", "-c", "while true; do echo Hello NFS! > /mnt/data/challenge3-nfs.log; sleep 3600; done"]
    volumeMounts:
    - mountPath: "/mnt/data"
      name: nfs-volume
  volumes:
  - name: nfs-volume
    persistentVolumeClaim:
      claimName: nfs-pvc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/03/pod-nfs.yml
pod/nfs-app created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pod nfs-app
NAME      READY   STATUS    RESTARTS   AGE
nfs-app   1/1     Running   0          7s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ ls -l /export/nfs
total 4
drwxrwxrwx 2 root root 4096 Jun 20 04:20 challenge3-nfs-pvc-pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat /export/nfs/challenge3-nfs-pvc-pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539/
cat: /export/nfs/challenge3-nfs-pvc-pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539/: Is a directory
pslearner@ip-172-31-24-243:~$ cat /export/nfs/challenge3-nfs-pvc-pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539/challenge3-nfs.log 
Hello NFS!
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
```


