#! /bin/zsh

# -- INSTALL HOMEBREW -- {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# -- }}}

# -- cask taps -- {{{
brew tap homebrew/cask
brew tap homebrew/cask-versions
# -- }}}

# -- sqlcheck tap and install -- {{{
brew tap gwerbin/tap
brew install --cask gwerbin/tap/sqlcheck
# }}}

# Regular installs
brew install ack
brew install rg
brew install antibody
brew install cmatrix
brew install cmus
brew install cointop
brew install composer
brew install cowsay
brew install coreutils
brew install dep
brew install fd
brew install figlet
brew install fortune
brew install fswatch
brew install fzf
brew install gnupg
brew install go
brew install gzip
brew install httpie
brew install hub
brew install irssi
brew install eddieantonio/eddieantonio/imgcat
brew install jq
brew install mycli
brew install pgcli
brew install mysql
brew install postgres
brew install mysql@$XP_MYSQL_VERSION
brew install ncurses
brew install neovim
brew install nginx
brew install ninja
brew install node
brew install nyancat
brew install php@$XP_PHP_VERSION
brew install pipes-sh
brew install pv
brew install rainbarf
brew install reattach-to-user-namespace
brew install rig
brew install rlwrap
brew install rtv
brew install screenfetch
brew install shpotify
brew install telnet
brew install thefuck
brew install tmux
brew install toilet
brew install tree
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install wp-cli
brew install zsh

# required for powerline font
brew install svn

brew tap possatti/possatti
brew install pokemonsay

# -- gotop -- {{{
brew tap cjbassi/gotop
brew install gotop
# --- }}}

# --- Fonts --- {{{
brew tap homebrew/cask-fonts
brew install --cask font-droid-sans-mono-nerd-font
brew install --cask font-droid-sans-mono-for-powerline
# --- }}}

# -- cask installs -- {{{
read response\?"Install Slack? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask slack
            ;;
        *)
            ;;
    esac

read response\?"Install Postman? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask postman
            ;;
        *)
            ;;
    esac

read response\?"Install Spotify? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask spotify
            ;;
        *)
            ;;
    esac

# bitwarden
read response\?"Install Bitwarden? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask bitwarden
            ;;
        *)
            ;;
    esac


# dash
read response\?"Install Dash? (https://kapeli.com/dash) [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask dash
            ;;
        *)
            ;;
    esac

# browsers
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
brew install --cask firefox-developer-edition

# other
read response\?"Install LiceCap? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask licecap
            ;;
        *)
            ;;
    esac

read response\?"Install FB Messenger? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask messenger
            ;;
        *)
            ;;
    esac

read response\?"Install Discord? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask discord
            ;;
        *)
            ;;
    esac
# -- }}}
