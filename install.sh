#! /bin/zsh

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
brew install mysql@5.7
brew install ncurses
brew install neovim
brew install newsboat
brew install nginx
brew install ninja
brew install node
brew install nyancat
brew install php@7.4
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
# -- }}}

# -- gotop -- {{{
brew tap cjbassi/gotop
brew install gotop
# --- }}}


# -- cask installs -- {{{
brew install --cask slack
brew install --cask postman
brew install --cask spotify
brew install --cask keepassx@0.4.4

# browsers
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
brew install --cask firefox-developer-edition
# -- }}}

# -- npm installations -- {{{
npm i -g nvm
npm i -g avn avn-n avn-nvm
npm i -g vue-cli
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
composer global require larvel/valet
valet install
valet use php@7.4
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

# -- SYMLINKS -- {{{
./sym.sh
# -- }}}
