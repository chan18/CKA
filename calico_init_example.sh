

kubeadm init --apiserver-advertise-address=172.42.42.100 --pod-network-cidr=192.16.0.0/16 /root/kubeinit.log 2>/dev/null


mkdir /home/vagrant/.kubeadm
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kubeadm

su - vagrant -c "kubectl create -f https://docs.projectcallico.org/v3.5/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml"

kubeadm token create --print-join-command > /joincluster.sh