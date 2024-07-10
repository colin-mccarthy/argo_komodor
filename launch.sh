#!/bin/bash
#
#
#

set -oe errexit

# desired cluster name; default is "kind"
KIND_CLUSTER_NAME="komodor"


echo "> initializing Kind cluster: ${KIND_CLUSTER_NAME}"

# create a cluster
cat <<EOF |  kind create cluster  --image kindest/node:v1.23.13 --name "${KIND_CLUSTER_NAME}" --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF

echo " ✓ helm repo add bitnami https://charts.bitnami.com/bitnami 📦 "
##helm
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo add backstage https://backstage.github.io/charts

helm install backstage  backstage/backstage --version 1.8.0  --create-namespace --namespace backstage --set='ui.serviceType=NodePort'
