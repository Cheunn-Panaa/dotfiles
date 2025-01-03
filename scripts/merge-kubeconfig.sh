set KUBECONFIG=~/.kube/config-aks:~/.kube/config-ovh 
kubectl config view --merge --flatten > config

