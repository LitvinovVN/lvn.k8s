#!/bin/bash
clear
kubectl create -f pod-nginx.yaml
echo "kubectl get pod -o wide"
kubectl get pod -o wide

echo "For editing pod-nginx enter:"
echo "kubectl edit pod pod-nginx"
echo ""
echo "For deliting pod-nginx enter:"
echo "kubectl delete pod pod-nginx"