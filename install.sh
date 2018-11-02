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
brew install fish
brew install fortune
brew install fswatch
brew install fzf
brew install gnupg
brew install googler
brew install howdoi
brew install httpie
brew install hub
brew install irssi
brew install jq
brew install libsodium
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
brew install swiftlint
brew install task
brew install telnet
brew install thefuck
brew install tmux
brew install toilet
brew install tree
brew install universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install wp-cli
brew install zsh
# -- }}}

# -- cask installs -- {{{
brew cask install spotify
brew cask install vivaldi
brew cask install sequelpro
brew cask install iterm2
brew cask install keepassx@0.4.4 
# -- }}}

# -- npm installations -- {{{
npm i -g nvm
npm i -g avn avn-n avn-nvm
npm i -g fb-messenger-cli
npm i -g taskbook
npm i -g vtop
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
valet start
# -- }}}

# -- SYMLINKS -- {{{
ln -sv $PWD/.alias ~
ln -sv $PWD/.bash_profile ~
ln -sv $PWD/.env ~
ln -sv $PWD/.function ~
ln -sv $PWD/.gitignore_global ~
ln -sv $PWD/.ignore ~
ln -sv $PWD/.lynx/ ~
ln -sv $PWD/.myclirc ~
ln -sv $PWD/.newsboat ~
ln -sv $PWD/.path ~
rm ~/.tmux/tmux.conf
ln -sv $PWD/.tmux.conf ~/.tmux/tmux.conf
ln -sv $PWD/.nvim ~/.config/nvim/
ln -sv $PWD/.vimrc ~
ln -sv $PWD/.xvimrc ~
ln -sv $PWD/.zsh-plugins ~
ln -sv $PWD/.zshrc ~
# -- }}}
