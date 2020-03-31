#!/bin/bash
clear
kubectl create -f pod-nginx.yaml
kubectl get pod -o wide
