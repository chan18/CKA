
vagrant ssh m1

sudo su

kubectl get pods --all-namespaces

vagrant ssh w1

sudo su

sudo crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps

vagrant ssh w2

sudo su

sudo crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps

