local M = {};

M.colors = {
    gunmetal      = '#282c34',
    charcoal_1    = "#3E4451",
    charcoal_2    = '#4b5263',
    paynes_grey_1 = '#5c6370',
    paynes_grey_2 = '#636d83',
    slate_grey_1  = '#828997',
    slate_grey_2  = '#7f848e',
    french_grey   = '#abb2bf',
    cyan          = '#56b6c2',
    blue          = '#61afef',
    purple        = '#c678dd',
    green         = '#98c379',
    red           = '#e06c75',
    dark_red      = '#be5046',
    orange        = '#d19a66',
    yellow        = '#e5c07b',
    pale_yellow   = '#e2be7d',
};

M.hues = {
    mono_background = M.colors.gunmetal,
    mono_0          = M.colors.paynes_grey_2,
    mono_1          = M.colors.french_grey,
    mono_2          = M.colors.slate_grey_1,
    mono_3          = M.colors.paynes_grey_1,
    mono_4          = M.colors.charcoal_2,
    hue_1           = M.colors.cyan,
    hue_2           = M.colors.blue,
    hue_3           = M.colors.purple,
    hue_4           = M.colors.green,
    hue_5           = M.colors.red,
    hue_5_2         = M.colors.dark_red,
    hue_6           = M.colors.orange,
    hue_6_2         = M.colors.yellow,
}

return M;
