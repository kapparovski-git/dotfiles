# Dotfiles

Personal configuration files for Arch Linux, managed with GNU Stow.

## Structure

* **i3**: Window manager keybindings and layout rules
* **alacritty**: Terminal emulator configuration (TOML)
* **starship**: Cross-shell prompt theme
* **fastfetch**: System information display
* **vim**: Personalized meta header

## Deployment

Clone and deploy using GNU Stow:

```bash
git clone git@github.com:kapparovski-git/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow i3 alacritty starship fastfetch
```

## Wallpaper

To set a wallpaper open the i3 config file:

```bash
vim ~/.config/i3/config
```

Add the exec_always line

```text
# Set wallpaper
exec_always --no-startup-id feh --bg-scale /home/<username>/Path/to/the/picture/wallpaper.png
```

Save and reload i3 [Super+Shift+R]
