export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# Prevent nice calls on windows
unsetopt BG_NICE

# aliases, functions, etc. {{{
[[ -e ~/.antibody ]] && source ~/.antibody || echo "Plugins not loaded."
[[ -e ~/.env ]] && source ~/.env
[[ -e ~/.path ]] && source ~/.path
[[ -e ~/.colors ]] && source ~/.colors
[[ -e ~/z.sh ]] && source ~/z.sh
[[ -e ~/.alias ]] && source ~/.alias || echo "Aliases not loaded."
[[ -e ~/.function ]] && source ~/.function || echo "Functions not loaded."
[[ -e ~/.ignore ]] && source ~/.ignore
[[ -e ~/.extra-aliases ]] && source ~/.extra-aliases
[[ -e ~/scripts/.script-source ]] && source ~/scripts/.script-source
# ZLE bindings, vi mode etc.
[[ -e ~/.zle ]] && source ~/.zle
# }}}

# get the fuck {{{
eval $(thefuck --alias)
# }}}

# Fix memory leak from find on osx for fzf {{{
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# }}}

# Set pagers {{{
if [[ "$(uname 2> /dev/null)" != "Linux" ]]; then
    # OSX
    export EDITOR="nvim"
    export PAGER="nvim -R"
    export MANPAGER="nvim -c 'set ft=man' -"
    # export MANPAGER="nvim -c 'set ft=man' -c 'set ft=man.php' -"
else
    # LINUX
    export EDITOR="nvim"
    export PAGER="nvim -R"
    export MANPAGER="less"
fi
# }}}

fpath=(~/.zsh.d/ $fpath)
