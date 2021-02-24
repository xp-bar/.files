#! /bin/zsh

# script variables
local xp_node_version=10.15.1
local xp_php_version=7.4
local xp_mysql_version=5.7

# -- INSTALL HOMEBREW -- {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# -- }}}

# -- INSTALL OH-MY-ZSH -- {{{
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# -- }}}

# -- cask taps -- {{{
brew tap homebrew/cask
brew tap homebrew/cask-versions
# -- }}}

# -- sqlcheck tap and install -- {{{
brew tap gwerbin/tap
brew install --cask gwerbin/tap/sqlcheck
# }}}

# -- homebrew installations -- {{{
brew install ack
brew install antibody
brew install cmatrix
brew install cmus
brew install cointop
brew install composer
brew install cowsay
brew install coreutils
brew install dep
brew install fd
brew install figlet
brew install fortune
brew install fswatch
brew install fzf
brew install gnupg
brew install go
brew install httpie
brew install hub
brew install irssi
brew install jq
brew install lynx
brew install mycli
brew install mysql
brew install mysql@$xp_mysql_version
brew install ncurses
brew install neovim
brew install newsboat
brew install nginx
brew install ninja
brew install node
brew install nyancat
brew install php@$xp_php_version
brew install pipes-sh
brew install pv
brew install rainbarf
brew install reattach-to-user-namespace
brew install rig
brew install rlwrap
brew install rtv
brew install screenfetch
brew install shpotify
brew install telnet
brew install thefuck
brew install tmux
brew install toilet
brew install tree
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install wp-cli
brew install zsh

# required for powerline font
brew install svn
# -- }}}

# -- gotop -- {{{
brew tap cjbassi/gotop
brew install gotop
# --- }}}

# --- Fonts --- {{{
brew tap homebrew/cask-fonts
brew install --cask font-droid-sans-mono-nerd-font
brew install --cask font-droid-sans-mono-for-powerline
# --- }}}

# -- cask installs -- {{{
brew install --cask slack
brew install --cask postman
brew install --cask spotify

# keepassx
brew install --cask keepassx
# version 0.4.4
brew install --cask dwihn0r-keepassx

# browsers
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
brew install --cask firefox-developer-edition
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
composer global require laravel/valet
valet install
valet use php@$xp_php_version
valet domain localhost
valet restart
# -- }}}

# -- python installs -- {{{
# get pip {{{
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
# }}}

pip install httpie
pip install http-prompt
# -- }}}

mkdir -p ~/.config
mkdir -p ~/.config/nvim/

# -- Install Vundle -- {{{
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
# -- }}}
#
# -- SYMLINKS -- {{{
./sym.sh
# -- }}}


# Install neovim plugins
nvim +PluginInstall +qall

# install neovim python 3 module
pip3 install neovim
