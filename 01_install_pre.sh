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