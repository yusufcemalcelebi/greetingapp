#!/bin/bash
set -e

curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

DECODED_KUBECONFIG=$(echo $ENCODED_KUBECONFIG | base64 -d)
echo $DECODED_KUBECONFIG > kubeconfig
export KUBECONFIG=./kubeconfig

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm upgrade -i greetingapp ./cd/greetingapp