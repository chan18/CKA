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


