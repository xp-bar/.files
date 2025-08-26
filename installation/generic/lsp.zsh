#! /bin/zsh

local lsp_options=(
    PHP
    Sass
    HTML
    Typescript
    Vue
    Ruby
    Lua
)

local selected=$(printf "%s\n" "${items[@]}" | fzf)

exit 0

# Intelephense (PHP)
pnpm install -g intelephense

# Somesass (Sass)
pnpm install -g some-sass-language-server

# HTML
pnpm install -g vscode-langservers-extracted

# Typescript
pnpm install -g typescript typescript-language-server

# Vue
pnpm install -g @vue/language-server

# Solargraph (Ruby)
gem install solargraph

# Lua
brew install lua-language-server
