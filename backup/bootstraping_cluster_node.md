# install packages

containerd
kubeadm
kubectl
kubelet

# joining

kubeadm join

start the process of joining to a cluster

network location of api server
bootstrap token not to a cluster
ca cert hash to rust the cert present by the api server. 

once the node join command intiated to joina cluster below process takes place.

* download cluster inforamtion and metadata
*  Node submit a CSR into a api server, to generate certificate used by kubelete on the node.This is used to auth the api server.
*  CA sign the CSR automatically in that cert request and kubeadm join will download the certification and sotre that on the  fils system `/var/lib/kubelet/pki` 
*  kubeadm join will generates kubelet.conf, reference to client certificate that we just downloaded and network location of api server that we auth against.
 
``` BASH
kubeadm join 172.16.94.10:6443 \
--token i0pr88.pbid2af0071xhuo1 \
--discovery-token-ca-cert-hash \
sha256:9a56f13bbae1f77e3a01fecc2bf8c59e6977d9c71c2d3482b988fa47767353d7
```

``` bash
kubeadm join 10.0.2.15:6443 \
--token d5dfqc.990qu2sytx7y99q1 \
--discovery-token-ca-cert-hash \
sha256:cf434d9677a2c4b179cf83a66fd6f5781211166791c98bee8cb5c8b0fba351a5
```