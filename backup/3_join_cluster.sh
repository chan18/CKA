
# kubeadm join 10.0.2.15:6443 \
# --token d5dfqc.990qu2sytx7y99q1 \
# --discovery-token-ca-cert-hash \
# sha256:cf434d9677a2c4b179cf83a66fd6f5781211166791c98bee8cb5c8b0fba351a5


vagrant ssh w1
vagrant ssh w2

sudo su

# apt install net-tools

swapoff -a
vi /etc/fstab


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


#Set the cgroup driver for containerd to systemd which is required for the kubelet.
#For more information on this config file see:
# https://github.com/containerd/cri/blob/master/docs/config.md and also
# https://github.com/containerd/containerd/blob/master/docs/ops.md

#At the end of this section, change SystemdCgroup = false to SystemdCgroup = true
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
        ...
#          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            SystemdCgroup = true

sudo sed -i 's/            SystemdCgroup = false/            SystemdCgroup = true/' /etc/containerd/config.toml



grep 'SystemdCgroup = true' /etc/containerd/config.toml



sudo systemctl restart containerd




sudo apt-get install -y apt-transport-https ca-certificates curl gpg
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg


echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt-get update && apt-cache policy kubelet | head -n 20 && VERSION=1.29.1-1.1 && sudo apt-get install -y kubelet=$VERSION kubeadm=$VERSION kubectl=$VERSION && sudo apt-mark hold kubelet kubeadm kubectl containerd



sudo systemctl status kubelet.service 
sudo systemctl status containerd.service 



exit



kubeadm token create --print-join-command

#below is a example
kubeadm join 10.0.2.15:6443 --token 1yic8v.arlphetzvf9r6yrb --discovery-token-ca-cert-hash sha256:c9e5270b75aa6060013c11f10e53b35a5bbd4356b2887861d5fec03a28617a6e  --v=5

kubeadm join 192.168.99.201:6443 --token 1u5s37.3vz878ijrsd3lcwz --discovery-token-ca-cert-hash sha256:1af8ca21c158a1e2981a472d59f92f370188df5ae384e6123c8ee6dd13892802 --v=5

curl -vvv http://192.168.99.201:6443 
curl -vvv http://10.0.2.15:6443

telnet 92.168.99.201 6443
telnet 10.0.2.15 6443
192.168.99.201:6443

ping 92.168.99.201

ping 10.0.2.15

telnet 10.0.2.15 6443





# kubeadm join 10.0.2.15:6443 \
#     --token cxndsl.6o32b94dd4tvfn3q \
#     --discovery-token-ca-cert-hash sha256:cf434d9677a2c4b179cf83a66fd6f5781211166791c98bee8cb5c8b0fba351a5


vagrant ssh m2



exit


#Back on Control Plane Node, this will say NotReady until the networking pod is created on the new node. 
#Has to schedule the pod, then pull the container.
kubectl get nodes 


#On the Control Plane Node, watch for the calico pod and the kube-proxy to change to Running on the newly added nodes.
kubectl get pods --all-namespaces --watch


#Still on the Control Plane Node, look for this added node's status as ready.
kubectl get nodes


#GO BACK TO THE TOP AND DO THE SAME FOR c1-node2 and c1-node3
#Just SSH into c1-node2 and c1-node3 and run the commands again.


# trouble shooting steps

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X 
iptables-save | grep -v KUBE | grep -v cali > clear.rules 
iptables-restore < clear.rules
modprobe overlay && modprobe br_netfilter && echo '1' > /proc/sys/net/ipv4/ip_forward
## join again when deleted node:
kubeadm join 192.168.1.195:6443 --token 2z5bhp.y9o0t1ppe4t28wtx --discovery-token-ca-cert-hash sha256:adfe17ca3aef931d9c46a373a5899edfeed4b41486b9d9c3a611dd0e074e5dab --v=5
# backup rules for next time reboot after all node ready:
iptables-save > /etc/sysconfig/iptables


ssh to the node
systemctl status kubectl <== Check service status
systemctl restart kubectl <== Try restart the service
journalctl -u kubectl <== If restart fails, check service log to find more detail for the failure, fix, restart

systemctl status kubelet 

systemctl status kubelet --no-pager --full

kubectl get node
kubectl delete node w1 -n kube-system


kubectl get nodes -o wide
kubectl get pods --all-namespaces -o wide

kubectl get pods -n kube-system -o wide | grep w1 | grep kube-proxy
kubectl get pods -n kube-system -o wide | grep w1 | grep calico-node

kubectl get pods -n kube-system
kubectl describe pod calico-node-mrdnv -n kube-system
kubectl logs calico-node-mrdnv -n kube-system
kubectl get events