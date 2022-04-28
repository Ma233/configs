local map = require('utils').map
vim.g.copilot_no_tab_map = true
vim.g.copilot_no_maps = true
map('i', '<C-e>', 'copilot#Accept()', { expr = true })
