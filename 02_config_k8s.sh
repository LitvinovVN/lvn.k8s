#!/bin/bash
clear
echo "---Configuring Kubernetes cluster---"

echo "Starting init master-node"
kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=NumCPU

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

watch kubectl get pods --all-namespaces

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl get nodes -o wide
echo "OK"
echo "---------------"