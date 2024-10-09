#!/bin/bash
ENV_LIST=$1

if [ -z "$1" ] 
then
    echo "Please give at least one env on which to deleted evited pods"
fi

for env in $ENV_LIST do
  for pod in $(kubectl get pods -n $env | grep Evicted | awk '{print $1}'); do
    echo "Deleting" $pod
    kubectl delete pods $pod -n $env
  done
done
