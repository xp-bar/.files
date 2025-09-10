-- xp-bar/plugins/nerdtree/git-plugin.lua
-- vim: set ts=2 sw=2:
-- For Xuyuanp/nerdtree-git-plugin

vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    ["Modified"]  = "*",
    ["Staged"]    = "+",
    ["Untracked"] = "",
    ["Renamed"]   = ">",
    ["Unmerged"]  = "═",
    ["Deleted"]   = "-",
    ["Dirty"]     = "~",
    ["Clean"]     = "",
    ["Ignored"]   = '',
    ["Unknown"]   = ""
}
