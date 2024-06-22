export XDG_CONFIG_HOME=$HOME/.config

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:$HOME/.local/bin/nvim/bin"
export PATH="$PATH:$HOME/.local/bin/go/bin"
export VIMRUNTIME="$HOME/.local/bin/nvim/share/nvim/runtime"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

. "$HOME/.cargo/env"

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export K9S_EDITOR="nvim"
export DOTF="$HOME/dotfiles"

export ZDOTDIR=~/.zsh
zcompile ~/.zsh/.zshrc.zwc ~/.zsh/.zshrc
export ZSH_COMPDUMP=~/.zsh/.zcompdump

skip_global_compinit=1
