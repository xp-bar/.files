export ZSH="/Users/nireland/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# plugins 
source <(antibody init)
antibody bundle < ~/.zsh-plugins
bindkey -v
eval $(thefuck --alias)

# source ~/.prompt
source ~/.alias
source ~/.env
source ~/.function
source ~/.ignore
source ~/.path
# export PATH="/usr/local/sbin:$PATH"
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/nireland/.composer/vendor/bin:/Users/nireland/.composer/vendor/bin:/Users/nireland/.vimpkg/bin
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# ZSH_THEME="xp-bar/zsh-bar-theme"
#
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern url)

