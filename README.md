# lvn.k8s
Configuring Kubernetes cluster

apt install git -y

git clone https://github.com/LitvinovVN/lvn.k8s.git

cd lvn.k8s

chmod +x 01_install_pre.sh

chmod +x 02_config_k8s.sh

chmod +x 03_joining_nodes.sh

./01_install_pre.sh

./02_config_k8s.sh

./03_joining_nodes.sh