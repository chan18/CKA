
kubectl get node
kubectl get pods --all-namespaces -o wide

# master node.
kubectl delete node w1 
kubectl delete node w2

#uninstall
kubeadm reset -f && apt-get -y purge kubeadm kubectl kubelet kubernetes-cni kube* && apt-get -y autoremove && rm -rf ~/.kube && rm -r /etc/cni/net.d && iptables -F && sudo iptables -t nat -F && ipvsadm --clear



