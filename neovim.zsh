#! /bin/zsh

# Install neovim plugins
nvim +PluginInstall +qall

# install neovim python 3 module
pip3 install neovim

# Coc.nvim setup
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
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
