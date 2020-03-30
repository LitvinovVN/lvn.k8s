#!/bin/bash
clear
echo "---Configuring Kubernetes cluster---"

modprobe br_netfilter
lsmod | grep br_netfilter

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
echo "---------------"

echo "Starting init master-node"
kubeadm init --pod-network-cidr=192.168.0.0/16

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

watch kubectl get pods --all-namespaces

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl get nodes -o wide
echo "OK"
echo "---------------"