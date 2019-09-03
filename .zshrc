export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Prevent nice calls on windows
unsetopt BG_NICE

# plugins {{{
source <(antibody init)
antibody bundle < ~/.zsh-plugins
# }}}

# aliases, functions, etc. {{{
[[ -e ~/.env ]] && source ~/.env
[[ -e ~/.path ]] && source ~/.path
[[ -e ~/.colors ]] && source ~/.colors
[[ -e ~/z.sh ]] && source ~/z.sh
[[ -e ~/.alias ]] && source ~/.alias || echo "Aliases not loaded."
[[ -e ~/.function ]] && source ~/.function || echo "Functions not loaded."
[[ -e ~/.ignore ]] && source ~/.ignore
[[ -e ~/.extra-aliases ]] && source ~/.extra-aliases
[[ -e ~/scripts/.script-source ]] && source ~/scripts/.script-source
# }}}

# vim bindings {{{
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
# }}}

# ZLE import {{{
source ~/.zle
# }}}

# get the fuck {{{
eval $(thefuck --alias)
# }}}

# fix zle history search {{{
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
# }}}

# Set pagers {{{
if [[ "$(uname 2> /dev/null)" != "Linux" ]]; then
    # OSX
    export PAGER="nvim -R"
    export MANPAGER="nvim -c 'set ft=man' -"
    # export MANPAGER="nvim -c 'set ft=man' -c 'set ft=man.php' -"
else
    # LINUX
    export PAGER="nvim -R"
    export MANPAGER="less"
fi
# }}}

fpath=(~/.zsh.d/ $fpath)
