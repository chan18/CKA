```bash
pslearner@ip-172-31-24-243:~$ kubectl create ns challenge4
namespace/challenge4 created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl config set-context --current --namespace=challenge4
Context "minikube" modified.
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get volumesnapshotclasses
NAME                     DRIVER                DELETIONPOLICY   AGE
csi-hostpath-snapclass   hostpath.csi.k8s.io   Delete           3h24m
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/04/pvc.yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
  namespace: challenge4
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
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/04/pvc.yml
persistentvolumeclaim/my-pvc created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pvc
NAME     STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS      AGE
my-pvc   Pending                                      csi-hostpath-sc   6s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ ~/challenges/04/pvc.yml^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ ^C
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/04/pod-write.yml
apiVersion: v1
kind: Pod
metadata:
  name: write-data-pod
  namespace: challenge4
spec:
  containers:
  - name: busybox
    image: busybox:1.36
    imagePullPolicy: IfNotPresent
    command: ["/bin/sh", "-c", "while true; do echo 'Hello, PluralSight!' > /mnt/data/challenge4.txt; sleep 3600; done"]
    volumeMounts:
    - mountPath: /mnt/data
      name: data
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: my-pvc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/04/pod-write.yml

pod/write-data-pod created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pods
NAME             READY   STATUS    RESTARTS   AGE
write-data-pod   1/1     Running   0          5s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/04/vol-snap.yml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: my-volumesnapshot
  namespace: challenge4
spec:
  volumeSnapshotClassName: csi-hostpath-snapclass
  source:
    persistentVolumeClaimName: my-pvc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/04/vol-snap.yml

volumesnapshot.snapshot.storage.k8s.io/my-volumesnapshot created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get volumesnapshot
NAME                READYTOUSE   SOURCEPVC   SOURCESNAPSHOTCONTENT   RESTORESIZE   SNAPSHOTCLASS            SNAPSHOTCONTENT                                    CREATIONTIME   AGE
my-volumesnapshot   true         my-pvc                              1Gi           csi-hostpath-snapclass   snapcontent-c466fa0e-fa0a-46c8-b7c5-624902db41b6   5s             5s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl delete pod write-data-pod
pod "write-data-pod" deleted


pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl delete pvc my-pvc
persistentvolumeclaim "my-pvc" deleted
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS      REASON   AGE
pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            Delete           Bound    challenge3/hostpath-pvc   csi-hostpath-sc            63m
pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539   1Gi        RWO            Delete           Bound    challenge3/nfs-pvc        nfs-provisioner            15m
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/04/pvc-restored.yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: restored-pvc
  namespace: challenge4
spec:
  dataSource:
    name: my-volumesnapshot
    kind: VolumeSnapshot
    apiGroup: snapshot.storage.k8s.io
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: csi-hostpath-sc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/04/pvc-restored.yml

persistentvolumeclaim/restored-pvc created
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl get pvc,pv
NAME                                 STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS      AGE
persistentvolumeclaim/restored-pvc   Bound    pvc-7674cdad-09f2-44e9-b1b7-34adeb1b60cb   1Gi        RWO            csi-hostpath-sc   11s

NAME                                                        CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS      REASON   AGE
persistentvolume/pvc-7674cdad-09f2-44e9-b1b7-34adeb1b60cb   1Gi        RWO            Delete           Bound    challenge4/restored-pvc   csi-hostpath-sc            9s
persistentvolume/pvc-ad779b5f-06fb-482c-98dd-b1b5e4f02349   1Gi        RWO            Delete           Bound    challenge3/hostpath-pvc   csi-hostpath-sc            64m
persistentvolume/pvc-bb9aff00-1836-4f8a-9703-36ebf50a6539   1Gi        RWO            Delete           Bound    challenge3/nfs-pvc        nfs-provisioner            16m
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ cat ~/challenges/04/pod-read.yml
apiVersion: v1
kind: Pod
metadata:
  name: verify-data-pod
  namespace: challenge4
spec:
  containers:
  - name: busybox
    image: busybox:1.36
    imagePullPolicy: IfNotPresent
    command: ["/bin/sh", "-c", "while true; do cat /mnt/data/challenge4.txt; sleep 3600; done"]
    volumeMounts:
    - mountPath: /mnt/data
      name: data
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: restored-pvc
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl apply -f ~/challenges/04/pod-read.yml

pod/verify-data-pod created
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
pslearner@ip-172-31-24-243:~$ kubectl get pod verify-data-pod
NAME              READY   STATUS    RESTARTS   AGE
verify-data-pod   1/1     Running   0          8s
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ kubectl exec -it verify-data-pod -- /bin/sh

/ # 
/ # 
/ # 
/ # cat /mnt/data/challenge4.txt
Hello, PluralSight!
/ # 
/ # 
/ # exit
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
pslearner@ip-172-31-24-243:~$ 
```
