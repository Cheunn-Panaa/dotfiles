tmux new-session \; \
  send-keys 'obelix-logs' C-m \; \
  split-window -v \; \
  split-window -h \; \
  send-keys 'top' C-m \; 