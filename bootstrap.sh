#!/bin/bash
#########################################
# A convenience script to bootstrap
# a new cluster for a razee deployment
#########################################
read -p 'cluster name: ' cluster
kubectl create configmap cluster-metadata --from-literal=name=$cluster
kubectl label cm/cluster-metadata razee/cluster-metadata="true"

read -p 'Provide the install command for Razee: ' command
$command

kubectl apply -f https://ibm.biz/jtp-razee-setup
