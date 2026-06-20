
vagrant ssh m1


kubectl create deployment hello-world --image=psk8s.azurecr.io/hello-app:1.0


kubectl run hello-world-pod --image=psk8s.azurecr.io/hello-app:1.0


kubectl get pods
kubectl get pods -o wide


vagrant ssh w2


sudo crictl --runtime-endpoint unix:///run/containerd/containerd.sock ps

exit

vagrant ssh m1

kubectl logs -n default hello-world-pod 
kubectl logs hello-world-pod 

kubectl get pods --all-namespaces
kubectl describe pod -n default hello-world-pod

kubectl exec -it  hello-world-pod -- /bin/sh
hostname
ip addr
exit


kubectl get deployment hello-world
kubectl get replicaset
kubectl get pods


kubectl describe deployment hello-world | more


kubectl describe replicaset hello-world | more


kubectl describe pod hello-world-[tab][tab] | more


kubectl expose deployment hello-world \
     --port=80 \
     --target-port=8080


kubectl get service hello-world


kubectl describe service hello-world


curl http://$SERVCIEIP:$PORT

curl http://10.97.29.35:80

kubectl get endpoints hello-world
curl http://$ENDPOINT:$TARGETPORT

curl http://10.244.190.71:8080

kubectl get deployment hello-world -o yaml | more 
kubectl get deployment hello-world -o json | more 

kubectl get all
kubectl delete service hello-world
kubectl delete deployment hello-world
kubectl delete pod hello-world-pod
kubectl get all


kubectl create deployment hello-world \
     --image=psk8s.azurecr.io/hello-app:1.0 \
     --dry-run=client -o yaml | more 


kubectl create deployment hello-world \
     --image=psk8s.azurecr.io/hello-app:1.0 \
     --dry-run=client -o yaml > deployment.yaml


more deployment.yaml


kubectl apply -f deployment.yaml


kubectl expose deployment hello-world \
     --port=80 --target-port=8080 \
     --dry-run=client -o yaml | more


kubectl expose deployment hello-world \
     --port=80 --target-port=8080 \
     --dry-run=client -o yaml > service.yaml 


more service.yaml 


kubectl apply -f service.yaml 


kubectl get all

vi deployment.yaml
Change spec.replicas from 1 to 20
     replicas: 20


kubectl apply -f deployment.yaml


kubectl get deployment hello-world
kubectl get pods | more 


kubectl get service hello-world
curl http://$SERVICEIP:PORT


kubectl edit deployment hello-world


kubectl get deployment hello-world


kubectl scale deployment hello-world --replicas=40
kubectl get deployment hello-world


kubectl delete deployment hello-world
kubectl delete service hello-world
kubectl get all






# debugging

cat /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf



mkdir /etc/systemd/system/kubelet.service.d/
ls /etc/systemd/system/kubelet.service.d/

vim /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

cat /etc/default/kubelet


# Note: This dropin only works with kubeadm and kubelet v1.11+
[Service]
Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf"
Environment="KUBELET_CONFIG_ARGS=--config=/var/lib/kubelet/config.yaml"
Environment="KUBELET_EXTRA_ARGS=--node-ip=10.0.2.15"
# This is a file that "kubeadm init" and "kubeadm join" generates at runtime, populating the KUBELET_KUBEADM_ARGS variable dynamically
EnvironmentFile=-/var/lib/kubelet/kubeadm-flags.env
# This is a file that the user can use for overrides of the kubelet args as a last resort. Preferably, the user should use
# the .NodeRegistration.KubeletExtraArgs object in the configuration files instead. KUBELET_EXTRA_ARGS should be sourced from this file.
EnvironmentFile=-/etc/default/kubelet
ExecStart=
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS

systemctl daemon-reload && systemctl restart kubelet

kubectl get nodes -o wide

kubectl logs -n default hello-world-pod 
kubectl logs hello-world-pod 

kubectl get pods --all-namespaces
kubectl describe pod -n default hello-world-pod

kubectl exec -it  hello-world-pod -- /bin/sh

cat /etc/default/kubelet

https://github.com/kubernetes/kubernetes/issues/63702

sudo apt-get install -y jq
local_ip="$(ip --json a s | jq -r '.[] | if .ifname == "enp0s8" then .addr_info[] | if .family == "inet" then .local else empty end else empty end')"
echo $local_ip
cat > /etc/default/kubelet << EOF
KUBELET_EXTRA_ARGS=--node-ip=$local_ip
EOF

cat /etc/default/kubelet

systemctl daemon-reload && systemctl restart kubelet


