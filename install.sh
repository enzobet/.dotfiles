#! /bin/bash

flavour=$(uname -s)
has_curl=$(which curl)

if [ -z $has_curl ]; then
  if [ $flavour == "Linux" ]; then
    sudo apt-get install -y curl git
  else
    brew install curl git
  fi
fi

# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
source ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.pyenv \
  nixpkgs.pyenv

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash


stow starship
stow nvim
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install neovim plugins
nvim --headless +PlugInstall +qall

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty
