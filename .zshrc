export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(asdf kubectl kubectx fzf)
source $ZSH/oh-my-zsh.sh

source $HOME/.zsh_profile
export COLORTERM=truecolor
# export TERM="screen-256color"

. "$HOME/.cargo/env"

. "$HOME/.acme.sh/acme.sh.env"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
