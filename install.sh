# -- INSTALL HOMEBREW -- {{{
if [[ $(brew which) != "/usr/local/bin/brew" ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi
# -- }}}

# -- cask taps -- {{{
brew tap caskroom/cask
brew tap caskroom/versions
# -- }}}

# -- sqlcheck tap and install -- {{{
brew tap gwerbin/tap
brew cask install gwerbin/tap/sqlcheck
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
brew install mysql@5.6
brew install ncurses
brew install neovim
brew install newsboat
brew install nginx
brew install ninja
brew install node
brew install nyancat
brew install php
brew install php@7.1
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
brew cask install spotify
brew cask install vivaldi
brew cask install sequelpro
brew cask install keepassx@0.4.4 
brew cask install figma
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
