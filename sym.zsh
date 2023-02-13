#! /bin/zsh

ln -sv $PWD/.global_gitignore ~/.gitignore
ln -sv $PWD/.gitconfig ~
ln -sv $PWD/.colors ~
ln -sv $PWD/.alias ~
ln -sv $PWD/.antibody ~
ln -sv $PWD/.function ~
ln -sv $PWD/.path ~
ln -sv $PWD/tmux.conf ~
ln -sv $PWD/.xvimrc ~
ln -sv $PWD/.zle ~
ln -sv $PWD/z/z.sh ~
ln -sv $PWD/.zsh-plugins ~
ln -sv $PWD/.zshrc ~
ln -sv $PWD/.koolaid ~
ln -sv $PWD/.alacritty.yml ~
ln -sv $PWD/.ackrc ~
ln -sv $PWD/.rgrc ~
ln -sv $PWD/custom-php-cs-fixers/index.php ~/.php-cs-fixer.php
touch ~/.ignored-stuff
touch ~/.env


# NVIM stuff
[ -d ~/.config/nvim/ ] || mkdir -p ~/.config/nvim/
ln -sv $PWD/nvim/init.vim ~/.config/nvim/init.vim
[ -d ~/.config/nvim/colors/ ] || mkdir -p ~/.config/nvim/colors/
ln -sv $PWD/nvim/colors/two.vim ~/.config/nvim/colors
[ -d ~/.config/nvim/autoload/lightline/colorscheme/ ] || mkdir -p ~/.config/nvim/autoload/lightline/colorscheme/
ln -sv $PWD/nvim/autoload/lightline/colorscheme/two.vim ~/.config/nvim/autoload/lightline/colorscheme
ln -sv $PWD/nvim/packs $HOME/.config/nvim/pack

[ -d ~/.config/figlet/ ] || mkdir -p ~/.config/figlet/
# no trailing slash since we're symlinking a folder
ln -sv $PWD/figlet-fonts/ ~/.config/figlet/fonts
