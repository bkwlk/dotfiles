#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

read_packages() {
    local file="$1"
    if [[ -f "$file" ]]; then
        cat "$file"
    else
        echo "File $file not found."
        exit 1
    fi
}

install_ubuntu() {
    local packages=$(read_packages "common_packages.txt")$(read_packages "ubuntu_packages.txt")
    echo "Updating package list..."
    sudo apt update

    echo "Installing packages: $packages"
    sudo apt install -y $packages
}

install_arch() {
    local packages=$(read_packages "common_packages.txt")$(read_packages "arch_packages.txt")
    echo "Updating package list..."
    sudo pacman -Sy

    echo "Installing packages: $packages"
    sudo pacman -S --noconfirm $packages
}

if command_exists apt; then
    echo "Detected Ubuntu system."
    install_ubuntu
elif command_exists pacman; then
    echo "Detected Arch system."
    install_arch
else
    echo "Unsupported system. This script only supports Ubuntu and Arch."
    exit 1
fi

TMUX_VERSION="3.4"
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.local/bin"
chsh -s $(which zsh)
# Install Neovim
# https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o /tmp/nvim.tar.gz && \
sudo rm -rf "$HOME/.local/bin/nvim" && \
sudo mkdir -p "$HOME/.local/bin/nvim" && \
sudo tar -C "$HOME/.local/bin/nvim" -xzf /tmp/nvim.tar.gz --strip-components=1

echo "Add neovim bin location to path!"
# echo 'echo \'export PATH="$PATH:/opt/nvim/bin"\' >> ~/.bashrc'

# Install starship
curl -sS https://starship.rs/install.sh | sh -s -- -y -b ~/.local/bin

# FZF install
# https://github.com/junegunn/fzf?tab=readme-ov-file#using-git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-fish --xdg --all --key-bindings --completion --no-update-rc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -fsSL https://fnm.vercel.app/install | bash -s -- -s
fnm use --install-if-missing 22

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete 

echo "Run stow -v ."
