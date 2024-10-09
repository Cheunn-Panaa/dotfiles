#!/bin/bash

#ex : scripts/runonkubapp.sh rct jobs-back df -h

if [ $# -lt 3 ]; then
    echo "Not enough args!"
    echo "Usage: $0 namespace application command"
    exit 1
fi

NAMESPACE=$1; shift
APPLICATION=$1; shift
COMMAND="$@"

#echo $NAMESPACE
#echo $APPLICATION
#echo $COMMAND

kubectl exec -it --namespace $NAMESPACE $(kubectl get pods --namespace $NAMESPACE | grep $APPLICATION | awk 'NR==1{print $1}') -- $COMMAND
