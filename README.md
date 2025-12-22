# Dotfiles
The repo uses GNU stow to manage the Dotfiles.

## Requirements
The following packages are used:
    - atuin (command history)
    - tmux (terminal multiplexer)
    - neovim (text editor)
    - superfile (terminal file mamager)
    - btop++ (system resource manager)
    - cava
    - fastfetch
    - rofi
    - starship (shell prompt)
    - zsh (shell)
    - bat (the better cat)

## Setting Up
1. Install stow using your package manager

2. Create the dotfiles folder on your computer
```
mkdir ~/dotfiles
```

3. Clone the repo and move into the folder:

```
git clone https://github.com/XrDystopian/Dotfiles.git ~/dotfiles

cd ~/dotfiles
```

4. Symlink all config files
```
stow .
```
