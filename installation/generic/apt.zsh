#! /bin/zsh

local packages=()

echo -e "\033[33mPreparing to install apt packages...\033[0m"
# sudo apt update

# Core Utilities
[[ $(command -v tmux) ]] || packages+=(tmux)
[[ $(command -v rg) ]] || packages+=(ripgrep)
[[ $(command -v fzf) ]] || packages+=(fzf)
[[ $(command -v nvim) ]] || packages+=(neovim)
[[ $(command -v jq) ]] || packages+=(jq)

if (( $packages[(Ie)fzf] )); then
    sudo apt install $packages
    echo -e "\033[34mPlease rerun now that FZF has been installed.\033[0m"
    exit
fi

if [[ ! $(command -v fzf) ]]; then 
    echo -e "\033[31mPlease rerun with FZF in PATH.\033[0m"
    exit
fi

read response\?"Install programming languages / tools / databases? [y/n] "
if [[ "$response" =~ "[yY][eE][sS]|[yY]" ]]; then
    local install_options=(
        php composer
        node npm
        mysql mycli
        postgres pgcli
        nginx
        tree
    )

    local selected=$(
        printf '%s\n' "${install_options[@]}" \
            | fzf \
                --multi \
                --prompt="Please select languages/databases/tools to install:" \
                --layout=reverse
        )
    for sele in $selected; do
        [[ $(command -v $sele) ]] || packages+=($sele)
    done
fi

read response\?"Install 'for fun' tools? [y/n] "
if [[ "$response" =~ "[yY][eE][sS]|[yY]" ]]; then
    [[ $(command -v cowsay) ]] || packages+=(cowsay)
    # [[ $(command -v figlet) ]] || packages+=(figlet)
    # [[ $(command -v fortune) ]] || packages+=(fortune)
    # [[ $(command -v toilet) ]] || packages+=(toilet)
fi

if [[ $#packages > 0 ]]; then
    sudo apt install $packages
else
    echo -e "\033[32mNothing to install.\033[0m"
fi

echo -e "\033[33mRemoving outdated packages:\033[0m"
sudo apt autoremove
echo -e "\033[32mDone!\033[0m"
