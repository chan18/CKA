# step - 1


# vagrant 

vagrant up to run all virtual environments.
``` bash
  vagrant up
  vagrant ssh m1
  vagrant ssh m2
  vagrant ssh m3
  vagrant ssh m4
```

# step -2

### need to install in all of the vms, from m1 to m4

``` bash
sudo su 
sudo apt-get install -y containerd

# https://kubernetes.io/blog/2023/08/15/pkgs-k8s-io-introduction/

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# apt-get update
# sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1
# apt-mark hold kubelet kubeadm kubectl containerd


apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl containerd
```

 
***Below setups are not working deprecation*** 
reaference: https://kubernetes.io/blog/2023/08/31/legacy-package-repository-deprecation/

``` bash
sudo su
sudo apt-get install -y containerd

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add 

#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg


# cat etc/apt/sources.list.d/kubernetes.list
# rm etc/apt/sources.list.d/kubernetes.list

# apt.kubernetes.io is replaced by pkgs.k8s.io   

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl containerd
```
---

# issues

### problem

gpg key 

### solution

``` bash
sudo mkdir -m 0755 -p /etc/apt/keyrings/

curl -fsSL https://example.com/EXAMPLE.gpg |
    sudo gpg --dearmor -o /etc/apt/keyrings/EXAMPLE.gpg

echo "deb [signed-by=/etc/apt/keyrings/EXAMPLE.gpg] https://example.com/apt stable main" |
    sudo tee /etc/apt/sources.list.d/EXAMPLE.list > /dev/null
```

---


### archtecture diagram
https://excalidraw.com/#json=vL_8TFnAfwHhn1TIGoIAO,8lBEyea--IbZxrsq76DHSA


# bootstraping cluster

```bash
  kubeadm init
```

* pre flight checks
* creates a certificate authority
* generates kubeconfig files
* generates static pod manifests
* wait for the control plane pods to start
* taints the control plane 
* generates a bootstrap token.
* starts add on componetns dns and kube-proxy.


# certificate autority

all the paramenters that we can use to pass it to the kubeadm 
https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/


kubeadm init by default will create  a self-signed authority.

We can allso pass custom PKI (public key infrastructure) to kubeam cli

this self-signed authority used to secure cluster communications. API server uses to ssecure http stream.

CA also used for authentication of users and cluster and cluster components.

Path to the CA certificates are at `/etc/kubernetes/pki` 

Distributed to each node

# Kubeeadm created kubeconfig files.

Kubeconfig file will have information on: 
* certificates used for client communciation.
* ip address and dns name of cluster api network location.

a collection of kubeconfig files are kept at `/etc/kubernetes`

Kubernetes admin account, super user inside kubernetes cluser. we use this to auth.
* admin.conf - kubernetes- admin

used to bypass authorization layer, Used when authorization is broken, in emergencies.
* super-admin.conf - kubernetes-admin

config filel for kubelet, to locate api server and present correct client certificate to authenticate
* kubelet.conf

* controller-manager.conf

scheduler config is use to tell where the api server is and which certificates to use to authenticate.
* scheduler.conf


# static pod manifests
