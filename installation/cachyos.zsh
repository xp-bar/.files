#! /bin/zsh

mv $HOME/.zshrc $HOME/.zshrc.bak

# git config
git config --local core.hooksPath .githooks/

# pacman
sudo pacman -Syu
sudo pacman -S ghostty
sudo pacman -S tmux
sudo pacman -S neovim
sudo pacman -S tree-sitter-cli

# tmux plugin manager - we have a submodule, so we just need to symlink it
[-d ~/.tmux/plugins ] || mkdir -p ~/.tmux/plugins
ln -sv $PWD/tpm ~/.tmux/plugins

# NVIM stuff - symlink
[ -d ~/.config/nvim/ ] && mv ~/.config/nvim/ ~/.config/nvim.bak/
ln -sv $PWD/nvim/ ~/.config/

# tmux stuff - symlink
[ -d ~/.config/tmux/ ] && mv ~/.config/tmux/ ~/.config/tmux.bak/
ln -sv $PWD/.config/tmux/ ~/.config/

[ -d ~/.config/ghostty/ ] && mv ~/.config/ghostty/ ~/.config/ghostty.bak/
ln -sv $PWD/.config/ghostty ~/.config
# ctrl+shift+, to reload ghostty config

[ -d ~/.config/hypr/ ] && mv ~/.config/hypr/ ~/.config/hypr.bak/
mkdir -p ~/.config/hypr
ln -sv $PWD/.config/hypr/hyprland.lua ~/.config/hypr

[ -d ~/.config/wofi/ ] && mv ~/.config/wofi/ ~/.config/wofi.bak/
ln -sv $PWD/.config/wofi ~/.config

[ -d ~/.config/noctalia/ ] && mv ~/.config/noctalia/ ~/.config/noctalia.bak/
ln -sv $PWD/.config/noctalia ~/.config

[ -d ~/.config/waybar/ ] && mv ~/.config/waybar/ ~/.config/waybar.bak/
ln -sv $PWD/.config/waybar ~/.config

# Install neovim plugins - we already have vim-plug as a submodule
nvim +'PlugInstall --sync' +qall &> /dev/null < /dev/tty
