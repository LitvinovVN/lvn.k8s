#!/bin/bash
clear
echo "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
echo ""
echo "kubectl get pods -n ingress-nginx"
kubectl get pods -n ingress-nginx
echo ""
echo "kubectl apply -f nginx-ingress.yaml"
kubectl apply -f nginx-ingress.yaml
echo ""
echo "kubectl get svc -n ingress-nginx"
kubectl get svc -n ingress-nginx