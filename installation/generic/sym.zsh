#! /bin/zsh

ln -sv $PWD/.global_gitignore ~/.gitignore
ln -sv $PWD/.gitconfig ~
ln -sv $PWD/.colors ~
ln -sv $PWD/.alias ~
ln -sv $PWD/.antidote ~
ln -sv $PWD/.zsh_plugins.txt ~
ln -sv $PWD/.function ~
ln -sv $PWD/.path ~
ln -sv $PWD/.tmux.conf ~
ln -sv $PWD/.zle ~
ln -sv $PWD/z/z.sh ~
ln -sv $PWD/.zshrc ~
ln -sv $PWD/.valias ~
ln -sv $PWD/.alacritty.yml ~
ln -sv $PWD/.ackrc ~
ln -sv $PWD/.rgrc ~
ln -sv $PWD/custom-php-cs-fixers/index.php ~/.php-cs-fixer.php
touch ~/.ignored-stuff
touch ~/.env


# NVIM stuff
[ -d ~/.config/nvim/ ] || mkdir -p ~/.config/nvim/
ln -sv $PWD/nvim/init.vim ~/.config/nvim/init.vim
[ -d ~/.config/nvim/lua/ ] || mkdir -p ~/.config/nvim/lua/
ln -sv $PWD/nvim/lua/xp-bar.lua ~/.config/nvim/lua/xp-bar.lua
ln -sv $PWD/nvim/lua/nvim-dap-config.lua ~/.config/nvim/lua/nvim-dap-config.lua
ln -sv $PWD/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
[ -d ~/.config/nvim/colors/ ] || mkdir -p ~/.config/nvim/colors/
ln -sv $PWD/nvim/colors/two.vim ~/.config/nvim/colors
[ -d ~/.config/nvim/autoload/lightline/colorscheme/ ] || mkdir -p ~/.config/nvim/autoload/lightline/colorscheme/
ln -sv $PWD/nvim/autoload/lightline/colorscheme/two.vim ~/.config/nvim/autoload/lightline/colorscheme
ln -sv $PWD/nvim/packs $HOME/.config/nvim/pack
[ -e ~/.config/nvim/dependencies/ ] || ln -sv $PWD/nvim/dependencies/ ~/.config/nvim/dependencies

[ -d ~/.config/figlet/ ] || mkdir -p ~/.config/figlet/
# no trailing slash since we're symlinking a folder
ln -sv $PWD/.config/figlet/fonts/ ~/.config/figlet/fonts

[ -d ~/.config/bat/ ] || mkdir -p ~/.config/bat/
ln -sv $PWD/.batconfig ~/.config/bat/config

[ -d ~/.config/wtf/ ] || mkdir -p ~/.config/wtf/
ln -sv $PWD/.config/wtf/config.yml ~/.config/wtf/config.yml
ln -sv $PWD/.config/wtf/scripts/ ~/.config/wtf/
