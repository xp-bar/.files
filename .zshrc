export ZSH="/Users/nireland/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# plugins {{{
source <(antibody init)
antibody bundle < ~/.zsh-plugins
# }}}

# vim bindings {{{
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search

function _launch() {
    open "/Applications/$(\ls -1 /Applications | sed 's/\.app//g' | fzf).app"
    zle && zle vi-insert
}
zle -N _launch launch-application

bindkey -M vicmd 'p' launch-application
# }}}

# get the fuck {{{
eval $(thefuck --alias)
# }}}

# aliases, functions, etc. {{{
source ~/.alias
source ~/.env
source ~/.function
source ~/.ignore
source ~/.path
source ~/.extra-aliases
source ~/z.sh
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
export PAGER="nvim -R"
export MANPAGER="nvim -c 'set ft=man' -"
# }}}

fpath=(~/.zsh.d/ $fpath)
