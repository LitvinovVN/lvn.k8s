#!/bin/bash
clear
echo "---Joining nodes to Kubernetes cluster---"
echo "Getting --token"
kubeadm token list
echo "If token has expired: kubeadm token create"
echo "---------------"
echo "Getting --discovery-token-ca-cert-hash"
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'
echo "---------------"