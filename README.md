# My dotfiles configuration

These dotfiles are still a work in progress, and will be updated as time goes.

The current installation process is for MacOS, however, Linux support will be added soon.  
This basically means just install [stow](https://www.gnu.org/software/stow/) using the Linux package manager (or something).

The [stow](https://www.gnu.org/software/stow/) package is being used to manage the symlinking of the dotfiles to the correct locations.

## Dotfiles

Dotfiles for the following applications / services can be found in this project:

- [NeoVim](./nvim/.config/nvim)
- Starship
- Tmux
- ZSH
- Kitty

Documentation for each of these will be added in due course.

## Installation & Configuration

Install stow

```bash
brew install stow
```

_Stow_ directories

```bash
stow starship
stow nvim
stow tmux
stow zsh
```
