export ZSH="/Users/nireland/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

source ~/.antigen/antigen.zsh
# plugins 

antigen bundle dotenv
antigen bundle osx
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle mafredri/zsh-async
antigen bundle MichaelAquilina/zsh-emojis

# theme
antigen theme xp-bar/zsh-bar-theme
# antigen theme ~/zshthemes xp-bar.zsh-theme --no-local-clone
#antigen theme ~/.oh-my-zsh/themes xp-bar.zsh-theme --no-local-clone

antigen apply

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


ZSH_THEME="xp-bar/zsh-bar-theme"

