#! /bin/zsh

# -- INSTALL HOMEBREW -- {{{
which brew >> /dev/null
if [[ $? != 0 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# -- }}}

# -- cask taps -- {{{
brew tap homebrew/cask
brew tap homebrew/cask-versions
# -- }}}

# -- WTFutil -- {{{
brew tap wtfutil/wtfutil
brew install wtfutil
# }}}

# -- sqlcheck tap and install -- {{{
brew tap gwerbin/tap
brew install --cask gwerbin/tap/sqlcheck
# }}}
#
# -- cli tools installation -- {{{
read response\?"Install CLI tools (ack, rg, etc.)? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install ack
            brew install rg
            brew install antidote
            brew install cmatrix
            brew install cowsay
            brew install coreutils
            brew install fd
            brew install figlet
            brew install fortune
            brew install fzf
            brew install gzip
            brew install jq
            brew install mycli
            brew install pgcli
            brew install ncurses
            brew install neovim
            brew install tmux
            brew install toilet
            brew install tree
            brew install vim
            brew install zsh

            # brew install reattach-to-user-namespace
            brew install rig
            brew install rlwrap

            brew install pipes-sh
            brew install pv

            # Github
            brew install gh
            brew install hub

            # Other
            brew install fswatch
            ;;
        *)
            ;;
    esac
# -- }}}

# -- PHP tools installation -- {{{
read response\?"Install PHP and PHP tools (composer, etc.)? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install php@$XP_PHP_VERSION
            brew install composer
            ;;
        *)
            ;;
    esac
# -- }}}

# -- PHP tools installation -- {{{
read response\?"Install wp-cli ? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install wp-cli
            ;;
        *)
            ;;
    esac
# -- }}}

# -- Go tools installation -- {{{
read response\?"Install Go and Go tools (dep, etc.)? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install go
            brew install dep
            ;;
        *)
            ;;
    esac
# -- }}}

# -- MySQL installation -- {{{
read response\?"Install MySQL? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install mysql
            brew install mysql@$XP_MYSQL_VERSION
            ;;
        *)
            ;;
    esac
# -- }}}

# -- MySQL installation -- {{{
read response\?"Install PostgreSQL? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install postgres
            ;;
        *)
            ;;
    esac
# -- }}}

# -- Node installation -- {{{
read response\?"Install Node? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install node
            ;;
        *)
            ;;
    esac
# -- }}}

# -- Node installation -- {{{
read response\?"Install nginx? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install nginx
            ;;
        *)
            ;;
    esac
# -- }}}

# -- Ruby installation -- {{{
read response\?"Install ruby? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install ruby
            ;;
        *)
            ;;
    esac
# -- }}}

# required for powerline font
brew install svn

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
read response\?"Install Browsers? (Chrome, Firefox) [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask google-chrome
            brew install --cask google-chrome-canary
            brew install --cask firefox
            brew install --cask firefox-developer-edition
            ;;
        *)
            ;;
    esac

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

read response\?"Install 1Password CLI? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install --cask 1password/tap/1password-cli
            ;;
        *)
            ;;
    esac

# -- Fun things installation -- {{{
read response\?"Install Fun stuff? [y/n] "
    case "$response" in
        [yY][eE][sS]|[yY])
            brew install eddieantonio/eddieantonio/imgcat
            brew install rainbarf
            brew tap possatti/possatti
            brew install pokemonsay
            ;;
        *)
            ;;
    esac
# -- }}}

# -- }}}
