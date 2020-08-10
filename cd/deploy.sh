#!/bin/bash
set -e

mkdir ~/.kube
DECODED_KUBECONFIG=$(echo $ENCODED_KUBECONFIG | base64 -d)
echo $DECODED_KUBECONFIG > ~/.kube/config

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm upgrade -i greetingapp ./cd/greetingapp