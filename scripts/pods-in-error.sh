#!/bin/bash

if [ -z "$1" ]
then
    echo "Running on accross all namespaces"
    kubectl get pods -o wide --all-namespaces | grep -v Running
else
    NAMESPACE=$1
    echo "Using Namespace $1"
    kubectl get pods -o wide -n $NAMESPACE | grep -v Running
fi
