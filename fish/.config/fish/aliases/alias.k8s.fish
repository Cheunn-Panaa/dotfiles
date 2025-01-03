export HISTTIMEFORMAT="%d/%m/%y %T "
export PS1='\u@\h \W $(kube_ps1)\$ '
export PATH="$HOME/.kube/bin:$PATH"

set -gx KUBECONFIG $HOME/.kube/config

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

alias k="kubectl"
alias kc="kubectl"
alias kx="kubectx"
alias kn="kubens"

alias kp="kubeon"
alias nokp="kubeoff"

alias ke="k exec -it"
alias logs='k logs'
alias ds='k get ds'
alias services="k get services"
alias pods='k get pods'
alias deps='k get deployments'
alias nodes="k get nodes"
#alias jobs="k get jobs"
alias np="k get networkpolicies"
alias secrets="k get secrets"
alias sa="k get serviceaccounts"
alias kpf="k port-forward --address=0.0.0.0"


# FEATURE KUSTOMIZE
#source <(kustomize completion bash)
# END FEATURE KUSTOMIZE

# FEATURE KOMPOSE
#source <(kompose completion bash)
# END FEATURE KOMPOSE


# FEATURE SLIMPROMPT
export PS1='\W $(kube_ps1)\$ '
# END FEATURE SLIMPROMPT
