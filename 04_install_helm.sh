#!/bin/bash
clear
echo "Installing Helm..."
wget https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz
tar xzvf helm-v3.1.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
echo "OK"

echo "Checking Helm version..."
helm version

echo "Adding Helm repository..."
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
echo "Checking Helm repository..."
helm search repo stable
helm repo update

echo "OK"
echo "---------------"