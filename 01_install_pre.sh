#!/bin/bash
clear
echo "Updating apt packages..."
apt-get update
echo "OK"
echo "---------------"

echo "Installing Midnight Commander..."
apt-get install -y mc
echo "OK"
echo "---------------"

echo "Installing CURL"
apt-get install -y apt-transport-https curl
echo "OK"
echo "---------------"

echo "Installing Docker..."
apt-get remove docker docker-engine docker.io containerd runc
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
echo "---------------"

# Setup daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Restart docker.
systemctl daemon-reload
systemctl restart docker

#sudo systemctl enable docker
echo "---------------"
echo "Docker hello-world test"
docker run hello-world
echo "OK"
echo "---------------\n"


echo "Installing Docker Compose..."
apt-get install -y docker-compose
echo "OK"
echo "---------------"


echo "Installing kubeadm, kubelet and kubectl"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl


modprobe br_netfilter
lsmod | grep br_netfilter

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
echo "---------------"

swapoff -a

