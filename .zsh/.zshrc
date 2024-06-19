# Set up the prompt

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e
#bindkey -v

export COLORTERM=truecolor

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# Configurations
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

eval "$(starship init zsh)"

#znap source marlonrichert/zsh-autocomplete
#znap source jeffreytse/zsh-vi-mode
[ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ] && source $XDG_CONFIG_HOME/fzf/fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions
bindkey '^Y' autosuggest-accept

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Aliases
alias ezrc="vim $ZDOTDIR/.zshrc"
alias dil="docker image ls"
alias dps="docker ps"
alias python="python3"
alias vim="nvim"
alias v="nvim"
alias projects="cd ~/projects"
alias f="free -h"
alias host_go_docs="godoc -http :9999"
alias gd="git diff"
alias gds="git diff --staged"
alias g="git"
alias glp="git --no-pager log --decorate=short --pretty=oneline -n1"
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gc="git commit"
alias dell_fan="sudo dell-bios-fan-control 0"
alias asts="aws sts get-caller-identity"
alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[\(.*\)\]/\1/gp" ~/.aws/credentials | fzf)'
alias t="terraform"
alias kc="kubectl config current-context"
alias kx="kubectx"
alias l="ls -la"
alias ll="ls -la"

# Overwrite sys commands
#alias cd="z"
#alias cat="bat"
#alias l="eza --icons -a -l --git"
alias ltree="eza --icons -l --git --tree --level=2"

alias ezp="nvim $DOTF/zsh/.zsh_profile"
alias yolo="git push --force"
alias cdutils="cd $DOTF/utils/.config/utils/"
alias cdd="cd $DOTF"
alias ewatch="nvim $DOTF/bin/.local/scripts/WATCHED_DIRECTORIES"
