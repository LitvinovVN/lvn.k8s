# lvn.k8s
## Configuring Kubernetes cluster

apt install git -y

git clone https://github.com/LitvinovVN/lvn.k8s.git

cd lvn.k8s


./01_install_pre.sh   --- Запустить на всех узлах

./02_config_k8s.sh   --- Запустить только на мастере

./03_joining_nodes_info.sh --- Запустить только на мастере для определения токенов

### Если скрипты не запускаются:

chmod +x 01_install_pre.sh

chmod +x 02_config_k8s.sh

chmod +x 03_joining_nodes_info.sh



## Запустить на всех узлах, заменив адрес и токены

kubeadm join --token cslmll.xuv67gft9yeru7r3 83.220.175.147:6443 --discovery-token-ca-cert-hash sha256:513fafac285636dd20b5d18386085e5f38c851acd9806035a518bbe63e735f19

## Если возникнет ошибка повторения имени хоста в кластере, сменяем имя с помощью команды

hostnamectl set-hostname lvn-nodeN

## Если возникнет ошибка наличия сертификита

kubeadm reset

## Изменение ip адреса узла кластера
Файл: /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

В самом конце через пробел прописать: --node-ip XXX.XXX.XXX.XXX

systemctl daemon-reload && systemctl restart kubelet
