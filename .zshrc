export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# Prevent nice calls on windows
unsetopt BG_NICE

setopt NO_BG_NICE # don't nice background tasks
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

# aliases, functions, etc. {{{
[[ -e ~/.antidote ]] && source ~/.antidote || echo "Plugins not loaded."
[[ -e ~/.env ]] && source ~/.env
[[ -e ~/.path ]] && source ~/.path
[[ -e ~/.colors ]] && source ~/.colors
[[ -e ~/z.sh ]] && source ~/z.sh
[[ -e ~/.alias ]] && source ~/.alias || echo "Aliases not loaded."
[[ -e ~/.function ]] && source ~/.function || echo "Functions not loaded."
[[ -e ~/.ignored-stuff ]] && source ~/.ignored-stuff
[[ -e ~/.extra-aliases ]] && source ~/.extra-aliases
[[ -e ~/scripts/.script-source ]] && source ~/scripts/.script-source
# ZLE bindings, vi mode etc.
[[ -e ~/.zle ]] && source ~/.zle
# }}}

# Set pagers {{{
if [[ "$(uname 2> /dev/null)" != "Linux" ]]; then
    # OSX
    export EDITOR="nvim"
    export PAGER="nvim -R"

    # older versions of nvim
    # export MANPAGER="nvim -c 'set ft=man' -"
    # export MANPAGER="nvim -c 'set ft=man' -c 'set ft=man.php' -"

    # new versions of nvim
    export MANPAGER="nvim +Man\!"
else
    # LINUX
    export EDITOR="nvim"
    export PAGER="nvim -R"
    export MANPAGER="less"
fi
# }}}

fpath=(~/.zsh.d/ $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --smart-case'

[[ -e ~/.jumbleberry ]] && source ~/.jumbleberry
