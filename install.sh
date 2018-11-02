# INSTALL HOMEBREW
if [[ $(brew which) != "/usr/local/bin/brew" ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

brew tap caskroom/cask
brew tap caskroom/versions


# homebrew installations
brew install composer
brew install mysql
brew install neovim
brew install ack
brew install hub
brew install tmux
brew install cmatrix
brew install shpotify
brew install googler
brew install howdoi
brew install node

# cask installs
brew cask install spotify
brew cask install vivaldi
brew cask install sequelpro
brew cask install iterm2
brew cask install keepassx@0.4.4 

# npm installations
npm i -g nvm
npm i -g avn avn-n avn-nvm

# git clone installations
DIR=$(pwd)
cd ~/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# valet installation
composer global require larvel/valet
valet install
valet domain localhost
valet start
