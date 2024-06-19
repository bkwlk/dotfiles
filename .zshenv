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
export VIMRUNTIME="$HOME/.local/bin/nvim/share/nvim/runtime"

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export K9S_EDITOR="nvim"
export DOTF="$HOME/dotfiles"

export ZDOTDIR=~/.zsh
zcompile ~/.zsh/.zshrc.zwc ~/.zsh/.zshrc
export ZSH_COMPDUMP=~/.zsh/.zcompdump

skip_global_compinit=1
