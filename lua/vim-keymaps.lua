vim.g.mapleader = ' '

local km = vim.keymap
local opts = { silent = true, noremap = true }

km.set('n', '<leader>h', '2<cmd>:vertical resize -2<CR>', opts)
km.set('n', '<leader>l', '2<cmd>:vertical resize +2<CR>', opts)
km.set('n', '<leader>j', '2<cmd>:resize +2<CR>', opts)
km.set('n', '<leader>k', '2<cmd>:resize -2<CR>', opts)

-- navigation
vim.g.tmux_navigator_no_mappings = 1

km.set('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
km.set('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
km.set('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
km.set('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)

km.set('n', '<leader>|', ':vnew<CR>', opts)
km.set('n', '<leader>-', ':new<CR>', opts)
km.set('n', '<leader>x', ':close<CR>', opts)
