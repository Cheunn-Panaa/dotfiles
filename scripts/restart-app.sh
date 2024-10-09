#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Not enough args!"
    echo "Usage: $0 namespace application"
    exit 1
fi

NAMESPACE=$1; shift
APPLICATION=$1; shift

#echo $NAMESPACE
#echo $APPLICATION

kubectl rollout restart --namespace $NAMESPACE deployment/$(kubectl get deployments --namespace $NAMESPACE | grep $APPLICATION | awk 'NR==1{print $1}')
