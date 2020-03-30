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

echo "Installing Docker..."
apt-get remove docker docker-engine docker.io containerd runc
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
echo "Docker hello-world test"
docker run hello-world
echo "OK"
echo "---------------"