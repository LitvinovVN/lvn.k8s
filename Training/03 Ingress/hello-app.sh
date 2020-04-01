#!/bin/bash
clear
echo "kubectl create namespace dev"
kubectl create namespace dev
echo ""

echo "kubectl create -f hello-app.yaml"
kubectl create -f hello-app.yaml
echo ""

echo "kubectl get deployments -n dev"
kubectl get deployments -n dev
echo ""

echo "kubectl create -f hello-app-service.yaml"
kubectl create -f hello-app-service.yaml
echo ""

echo "kubectl get svc -n dev"
kubectl get svc -n dev
echo ""

echo "kubectl describe ingress  -n dev"
kubectl describe ingress  -n dev
echo ""