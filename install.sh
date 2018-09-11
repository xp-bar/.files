# INSTALL HOMEBREW
if [[ $(brew which) != "/usr/local/bin/brew" ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

brew tap caskroom/cask
brew tap caskroom/versions

ln -sv "~/.dotfiles/system/.env" ~
ln -sv "~/.dotfiles/programs/.gitconfig" ~
ln -sv "~/.dotfiles/programs/.gitignore_global" ~
ln -sv "~/.dotfiles/programs/.vimrc" ~
ln -sv "~/.dotfiles/programs/.nvmrc" ~

# bash_profile links
ln -sv "~/.dotfiles/.bash_profile" ~
ln -sv "~/.dotfiles/system/.alias" ~
ln -sv "~/.dotfiles/system/.function" ~
ln -sv "~/.dotfiles/system/.path" ~
ln -sv "~/.dotfiles/system/.prompt" ~

exit

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
brew cask install atom
brew cask install google-chrome
brew cask install spotify
brew cask install virtualbox
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

# apm installations
apn install Zen
apn install activate-power-mode
apn install atom-autocomplete-php
apn install atom-beautify
apn install atom-bracket-highlight
apn install atom-clock
apn install atom-debug-ui
apn install atom-html-templates
apn install atom-ide-ui
apn install atom-idea
apn install atom-material-ui
apn install atom-math
apn install atom-notes
apn install atom-path-intellisense
apn install atom-typescript
apn install block-comment
apn install busy-signal
apn install change-case
apn install color-picker
apn install docblockr
apn install emmet
apn disable emmet
apn install emmet-simplified
apn install emmet-snippets-compatibility
apn install es6-javascript
apn install expose
apn install fancy-bracket-matcher
apn install file-icons
apn install fonts
apn install genesis-ui
apn install git-blame
apn install gitkraken-bisect
apn install gitkraken-glo
apn install hey-pane
apn install highlight-line
apn install highlight-selected
apn install hyperclick
apn install ide-json
apn install ide-vue
apn install intentions
apn install jackhammer-syntax
apn install js-hyperclick
apn install language-blade
apn install language-csv
apn install language-dotenv
apn install language-generic-config
apn install language-markdown
apn install language-vue
apn install laravel
apn install linter
apn install linter-phpcs
apn install linter-ui-default
apn install markdown-preview-plus
apn install material-ui
apn install minimap
apn install minimap-pigments
apn install monokai
apn install php-debug
apn install php-fmt
apn install php-hyperclick
apn install php-integrator-annotations
apn install php-integrator-base-legacy-php56
apn install php-integrator-call-tips-legacy-php56
apn install php-integrator-linter-legacy-php56
apn install php-integrator-navigation
apn install php-integrator-navigation-legacy-php56
apn install php-integrator-refactoring
apn install php-integrator-refactoring-legacy-php5
apn install php-integrator-symbol-viewer
apn install php-integrator-tooltips-legacy-php56
apn install pigments
apn install project-manager
apn install qolor
apn install sort-lines
apn install tablr
apn install teletype
apn install vim-mode-plus
apn install vue-hyperclick


