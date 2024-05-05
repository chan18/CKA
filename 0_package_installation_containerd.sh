vagrant ssh m1

sudo su

sudo swapoff -a
vi /etc/fstab

#https://kubernetes.io/docs/setup/production-environment/container-runtimes/
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system

sudo apt-get install -y containerd

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

# https://github.com/containerd/cri/blob/master/docs/config.md and also
# https://github.com/containerd/containerd/blob/master/docs/ops.md

#At the end of this section, change SystemdCgroup = false to SystemdCgroup = true
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
        ...
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            SystemdCgroup = true

sudo sed -i 's/            SystemdCgroup = false/            SystemdCgroup = true/' /etc/containerd/config.toml

grep 'SystemdCgroup = true' /etc/containerd/config.toml

sudo systemctl restart containerd
---
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
apt-cache policy kubelet | head -n 20 

VERSION=1.29.1-1.1
sudo apt-get install -y kubelet=$VERSION kubeadm=$VERSION kubectl=$VERSION 
sudo apt-mark hold kubelet kubeadm kubectl containerd

sudo systemctl status kubelet.service
sudo systemctl status containerd.service

