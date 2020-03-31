#!/bin/bash
clear
echo "kubectl apply -f replicaset-nginx.yaml"
kubectl apply -f replicaset-nginx.yaml
echo ""
echo "kubectl get replicaset"
kubectl get replicaset
echo ""
echo "For editing replicaset enter:"
echo "kubectl edit replicaset replicaset-nginx"
echo "For deliting replicaset enter:"
echo "kubectl delete rs replicaset-nginx"