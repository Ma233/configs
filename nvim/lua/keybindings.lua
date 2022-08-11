local map = require('utils').map

-- leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- handle the long line situation
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', 'gj', 'j')
map('n', 'gk', 'k')

-- fix up command mode like a terminal
map('c', '<C-n>', '<t_kd>')
map('c', '<C-p>', '<t_ku>')
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

-- easy tab
map('n', 'tn', '<cmd>tabnext<CR>')
map('n', 'tp', '<cmd>tabprevious<CR>')
map('n', 'to', ':<C-u>tabnew')

-- make Y behave like other capitals
map('n', 'Y', 'y$')

-- escape the line break
map('v', '$', '$h')

-- switch ' `
map('n', "'", '`')
map('n', '`', "'")

-- copy to os clipboard
map('v', '<C-c>', '"+y')

-- search selected text
map('v', '*', 'y/<<C-r>0><CR>')

-- simple mark by M
map('n', 'M', 'mb')

-- I don't need ex mode
map('n', 'Q', 'qq')

-- fix highlight with long text
map('n', '<F12>', '<cmd>syntax sync minlines=5000<CR>')

-- save with sudo permission
map('c', 'ww', 'noautocmd w')
map('c', 'w!!', 'w !sudo tee >/dev/null %')
