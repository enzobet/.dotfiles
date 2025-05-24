#!/bin/bash

base_dir=$(realpath $0)
base_dir=$(dirname $base_dir)
dot_files=$(realpath $base_dir/../)

projects_dir="~/projects"

# Install base utils
sudo pacman -S git base-devel cmak nina curl less dhcpcd

# Graphics
sudo pacman -S vulkan-tools vulkan-radeon

# Install yay
sudo pacman -S --needed yay

# hyprland requirements
sudo pacman -S \
    hyprpaper \
    xdg-desktop-portal-hyprland \
    cliphist \
    mako \
    fuzzel \
    nwg-drawer \
    pavucontrol \
    waybar

# Shell utilities
sudo pacman -S \
    eza \
    git \
    starship \
    lazygit \
    stow \
    fish \
    zoxide \
    pyenv \
    fzf

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

nvm install lts
nvm use lts

# Config files
stow fish
stow fuzzel
stow kitty
stow waybar
stow nvim
stow mako
stow nwg-drawer
stow wallpapers

stow --adopt hypr
git checkout .

# Change default shell
chsh -s $(which fish)

# Neovim
if ![[ -d $projects_dir ]]; then
    mkdir -p $projects_dir
fi

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install

cd $base_dir
