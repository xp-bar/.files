#! /bin/zsh

# Install neovim plugins
nvim +'PlugInstall --sync' +qall &> /dev/null < /dev/tty

# install neovim python 3 module
pip3 install neovim

# vim sessions directory
mkdir -p ~/vim-sessions

# Coc.nvim setup
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

# pdv directory
if [ -d $HOME/.vim/bundle/pdv/templates ]
then
    mkdir -p ~/.pdv-templates
    cp ~/.vim/bundle/pdv/templates/* ~/.pdv-templates/
    echo "Copied pdv templates"
fi

# install the license key
[ -e ~/.env ] || touch ~/.env
read -s license\?"Intelephense License Key: [hidden] "
if [[ $(wc -l ~/.env | awk '{print $1}') -eq 0 ]]; then
    echo "export INTELEPHENSE_LICENSE_KEY=\"$license\"" > ~/.env
else
    gsed -nri "/^export INTELEPHENSE_LICENSE_KEY=/!p;\$aexport INTELEPHENSE_LICENSE_KEY=\"$license\"" ~/.env
fi
