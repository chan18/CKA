vagrant ssh m1

wget https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml

# edit CALICO IPV4POOL CIDR for CIDER configuration.
# By default 192.16.0.0/16
vi calico.yaml

sudo kubeadm init --kubernetes-version v1.29.1

# sudo kubeadm init --kubernetes-version v1.29.1
# [init] Using Kubernetes version: v1.29.1
# [preflight] Running pre-flight checks
#         [WARNING KubernetesVersion]: Kubernetes version is greater than kubeadm version. Please consider to upgrade kubeadm. Kubernetes version: 1.29.1. Kubeadm version: 1.28.x
# error execution phase preflight: [preflight] Some fatal errors occurred:
#         [ERROR NumCPU]: the number of available CPUs 1 is less than the required 2
#         [ERROR Mem]: the system RAM (969 MB) is less than the minimum 1700 MB
# [preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`
# To see the stack trace of this error execute with --v=5 or higher

#remove the kubernetes-version parameter if you want to use the latest.
#sudo kubeadm init

#Before moving on review the output of the cluster creation process including the kubeadm init phases, 
#the admin.conf setup and the node join command

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f calico.yaml

kubectl get pods --all-namespaces

kubectl get pods --all-namespaces --watch

kubectl get pods --all-namespaces

kubectl get nodes 

sudo systemctl status kubelet.service 

ls /etc/kubernetes/manifests

sudo more /etc/kubernetes/manifests/etcd.yaml
sudo more /etc/kubernetes/manifests/kube-apiserver.yaml

ls /etc/kubernetes
# ls /etc/kubernetes
# admin.conf  controller-manager.conf  kubelet.conf  manifests  pki  scheduler.conf
