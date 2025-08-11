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
npm i -g yarn
# -- }}}

# -- NVM installation -- {{{
read response\?"Install NVM? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        nvm install $xp_node_version
        nvm use $xp_node_version
            ;;
        *)
            ;;
    esac
# -- }}}

# make sure this repo uses my email, not a work one
git config --local user.email "nick@nicholasireland.ca"
git config --local user.name "Nicholas Ireland"

# setup hooks
git config --local core.hooksPath .githooks/


# git clone installations -- {{{
# DIR=$(pwd)
# cd ~/
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# cd ~/
# rm -rf fonts
# cd $DIR
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

# -- Directories -- {{{
mkdir -p ~/.config
mkdir -p ~/.config/nvim/
# ---}}}

# -- Install vim-plug -- {{{
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
read response\?"Install custom PHP-CS-Fixers? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
        cd ./custom-php-cs-fixers && composer install && cd ../
            ;;
        *)
            ;;
    esac
# -- }}}
