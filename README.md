# lvn.k8s
Configuring Kubernetes cluster

apt install git -y

git clone https://github.com/LitvinovVN/lvn.k8s.git

cd lvn.k8s

chmod +x 01_install_pre.sh

chmod +x 02_config_k8s.sh

chmod +x 03_joining_nodes.sh

./01_install_pre.sh   --- Запустить на всех узлах

./02_config_k8s.sh   --- Запустить только на мастере

./03_joining_nodes.sh --- Запустить только на мастере для определения токенов

Запустить на всех узлах, заменив адрес и токены

kubeadm join --token cslmll.xuv67gft9yeru7r3 83.220.175.147:6443 --discovery-token-ca-cert-hash sha256:513fafac285636dd20b5d18386085e5f38c851acd9806035a518bbe63e735f19