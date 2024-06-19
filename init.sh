PACKAGE_FILE="packages"

# Check if the file exists
if [[ ! -f "$PACKAGE_FILE" ]]; then
  echo "Package file $PACKAGE_FILE not found!"
  exit 1
fi

# Read the package file and install each package
while IFS= read -r package; do
  if [[ -n "$package" ]]; then
    echo "Installing $package..."
    sudo apt-get install -y "$package"
  fi
done < "$PACKAGE_FILE"

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
curl -sS https://starship.rs/install.sh | sh


# FZF install
# https://github.com/junegunn/fzf?tab=readme-ov-file#using-git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-fish --xdg --all --key-bindings --completion --no-update-rc

echo "Run stow -v ."
