# step - 1
sudo su 
``` bash
sudo apt-get install -y containerd

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -


cat etc/apt/sources.list.d/kubernetes.list
rm etc/apt/sources.list.d/kubernetes.list

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ 
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1
apt-mark hold kubelet kubeadm kubectl containerd

apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl containerd
```
---

# issue 

### problem
``` bash
sudo mkdir -m 0755 -p /etc/apt/keyrings/

curl -fsSL https://example.com/EXAMPLE.gpg |
    sudo gpg --dearmor -o /etc/apt/keyrings/EXAMPLE.gpg

echo "deb [signed-by=/etc/apt/keyrings/EXAMPLE.gpg] https://example.com/apt stable main" |
    sudo tee /etc/apt/sources.list.d/EXAMPLE.list > /dev/null
```

### solution

``` bash
sudo mkdir -m 0755 -p /etc/apt/keyrings/

curl -fsSL https://example.com/EXAMPLE.gpg |
    sudo gpg --dearmor -o /etc/apt/keyrings/EXAMPLE.gpg

echo "deb [signed-by=/etc/apt/keyrings/EXAMPLE.gpg] https://example.com/apt stable main" |
    sudo tee /etc/apt/sources.list.d/EXAMPLE.list > /dev/null
```

---



# vagrant 

vagrant up to run all virtual environments.
``` bash
    vagrant up
```