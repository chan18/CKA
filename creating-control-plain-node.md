
``` bash

# pod network manifest file from calcio
wget https://docs.projectcalico.org/manifests/calico.yaml


kubeadm config print init-defaults | tee ClusterConfiguration.yaml

# kube init
sudo kubeadm init \
--config=ClusterConfiguration.yaml \
--cri-socket /run/containerd/containerd.sock

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# kubectl will send it to the api server.
kubectl apply -f calico.yaml
```