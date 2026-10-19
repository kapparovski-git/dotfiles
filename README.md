# Dotfiles

Personal configuration files for Arch Linux, managed with GNU Stow.

## Structure

* **i3**: Window manager keybindings and layout rules
* **alacritty**: Terminal emulator configuration (TOML)
* **starship**: Cross-shell prompt theme
* **fastfetch**: System information display

## Deployment

Clone and deploy using GNU Stow:

```bash
git clone git@github.com:kapparovski-git/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow i3 alacritty starship fastfetch
```
