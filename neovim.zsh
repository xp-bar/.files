#! /bin/zsh

# Install neovim plugins
nvim +PluginInstall +qall

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

npm install \
    coc-json \
    coc-phpls \
    coc-vetur \
    coc-tsserver \
    --global-style \
    --ignore-scripts \
    --no-bin-links \
    --no-package-lock \
    --only=prod

nvim +CocUpdateSync +qall
