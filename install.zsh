#! /bin/zsh

# script variables
export XP_NODE_VERSION=10.15.1
export XP_PHP_VERSION=7.4
export XP_MYSQL_VERSION=8

# -- INSTALL OH-MY-ZSH -- {{{
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# -- }}}

# -- homebrew installations -- {{{
./installation/generic/brew.zsh
# -- }}}

# -- npm installations -- {{{
npm i -g vue-cli
npm install --global yarn
# -- }}}

# -- node version manager -- {{{
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install $xp_node_version
nvm use $xp_node_version
# -- }}}

# make sure this repo uses my email, not a work one
git config --local user.email "nick@nicholasireland.ca"
git config --local user.name "Nicholas Ireland"

# setup hooks
git config --local core.hooksPath .githooks/


# git clone installations -- {{{
DIR=$(pwd)
cd ~/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
# -- }}}

# -- valet installation -- {{{
read response\?"Install valet? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
		composer global require laravel/valet
		./valet.zsh
            ;;
        *)
            ;;
    esac
# -- }}}

# -- python installs -- {{{
# get pip {{{
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
# }}}

pip install httpie
pip install http-prompt
# -- }}}

# -- Directories -- {{{
mkdir -p ~/.config
mkdir -p ~/.config/nvim/
# ---}}}

# -- Install Vundle -- {{{
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
# -- }}}

# -- Install TPM -- {{{
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# -- }}}

# -- SYMLINKS -- {{{
./installation/generic/sym.sh
# -- }}}

# -- Neovim setup -- {{{
./installation/generic/neovim.zsh
# -- }}}

# -- PHP-CS-Fixer setup -- {{{
cd ./custom-php-cs-fixers && composer install && cd ../
# -- }}}
