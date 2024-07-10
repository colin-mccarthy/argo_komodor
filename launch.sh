#!/bin/bash
#
#

set -oe errexit

# desired cluster name; default is "kind"
KIND_CLUSTER_NAME="kind"


echo "> initializing Kind cluster: ${KIND_CLUSTER_NAME}"

# create a cluster
cat <<EOF | kind create cluster  --image kindest/node:v1.23.13 --name "${KIND_CLUSTER_NAME}" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF



## helm
helm repo add argo-cd https://argoproj.github.io/argo-helm

helm dep update charts/argo-cd/

helm install argo-cd charts/argo-cd/


echo "> 😊😊 Verify Cluster install"

sleep 30

echo "> 😊😊 Verify Cluster install...."

sleep 30

echo "> 😊😊 Verify Cluster install...."

sleep 30

echo "> done! 📦 "

kubectl get pods 
