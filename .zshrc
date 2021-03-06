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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --smart-case'
