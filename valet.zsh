#! /bin/zsh
local xp_php_version=7.4

valet use php@$xp_php_version
valet install
valet domain localhost
valet restart
valet secure
