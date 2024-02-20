#!/bin/zsh

function _error() {
    echo -e "\033[31m$*\033[0m"
    exit 1
}

[ -v $1 ] && _error "filename is required"
[ ! -e $1 ] && _error "file must exist"

local contents=$(grep $1 -e "^##")

# concat (linewise) the heading portion in [], and the link portion in (), then remove the space between them
paste -d " " -- \
    <(echo "$contents" | gsed ':loop; s/#\([#]\{1,\}\)/\t\1/g; t loop; s/\t/    /g; s/^\([ ]*\)# /\1- /g; s/^    //g; s/- \(.*\)/- [\1]/g') \
    <(echo "$contents" | gsed 's/ /-/g; s/^[#-]*\(.*\)/(#\L\1)/g') |\
    gsed 's/] (/](/g'

