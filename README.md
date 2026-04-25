# dotfiles

Personal dotfiles for an Arch Linux setup running Hyprland, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Stack

| Category        | Tool                                     |
| --------------- | ---------------------------------------- |
| OS              | Arch Linux                               |
| Compositor      | Hyprland (also i3 / Sway configs)        |
| Terminal        | Ghostty (also Kitty, Alacritty, WezTerm) |
| Shell           | Fish (also ZSH)                          |
| Editor          | Neovim (lazy.nvim)                       |
| Prompt          | Starship                                 |
| Bar             | Waybar                                   |
| Launcher        | Fuzzel / nwg-drawer                      |
| Notifications   | Mako                                     |
| Display manager | SDDM + Tokyo Night theme                 |
| Multiplexer     | Tmux                                     |
| File manager    | Yazi                                     |
| Session manager | Sesh                                     |
| Music           | Spotatui                                 |

## Quick start

**Prerequisites:** `git` and `stow` must be installed.

```bash
# Arch
sudo pacman -S git stow

# MacOS
brew install stow
```

**Clone into your home directory**

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

**Stow the configs you want**

Each top-level directory is a stow package. Run `stow <package>` from inside `~/.dotfiles` to symlink its contents into `$HOME`.

```bash
stow nvim
stow fish
stow ghostty
stow starship
stow tmux
stow hypr
stow waybar
stow yazi
```

To remove symlinks for a package, use `stow -D <package>`.

## Full Hyprland install (Arch)

An automated install script is provided for a fresh Hyprland setup on Arch:

```bash
bash install/install_hyprland_arch.sh
```

This installs the core Hyprland stack (waybar, mako, fuzzel, hyprpaper, hyprlock, cliphist), shell utilities (fish, fzf, zoxide, eza, lazygit), Node via nvm, builds Neovim from source, and stows all relevant configs.

## Packages

| Package     | Config location                  |
| ----------- | -------------------------------- |
| `nvim`      | `nvim/.config/nvim`              |
| `fish`      | `fish/.config/fish`              |
| `ghostty`   | `ghostty/.config/ghostty`        |
| `hypr`      | `hypr/.config/hypr`              |
| `waybar`    | `waybar/.config/waybar`          |
| `starship`  | `starship/.config/starship.toml` |
| `tmux`      | `tmux/.tmux.conf`                |
| `yazi`      | `yazi/.config/yazi`              |
| `sesh`      | `sesh/.config/sesh`              |
| `spotatui`  | `spotatui/.config/spotatui`      |
| `kitty`     | `kitty/.config/kitty`            |
| `alacritty` | `alacritty/.config/alacritty`    |
| `wezterm`   | `wezterm/.wezterm.lua`           |
| `helix`     | `helix/.config/helix`            |
| `fuzzel`    | `fuzzel/.config/fuzzel`          |
| `mako`      | `mako/.config/mako`              |
| `i3`        | `i3/.config/i3`                  |
| `sway`      | `sway/.config/sway`              |
| `sddm`      | `sddm/etc/sddm.conf`             |
