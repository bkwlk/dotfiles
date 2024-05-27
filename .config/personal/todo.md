# FZF BIND
bind-key F send-keys 'fd --type f | fzf-tmux --border --margin=0,1 --preview "bat -f -P --plain {1}" | xargs -r nvim +' Enter
