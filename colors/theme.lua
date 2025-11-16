vim.opt.background = 'dark'
vim.g.colors_name = 'theme'

package.loaded['lush_theme.theme'] = nil
require('lush')(require('lush_theme.theme'))

-- use 'vim.cmd("colorscheme theme")' to set the theme
