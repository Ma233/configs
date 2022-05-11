local map = require('utils').map
vim.g.copilot_no_tab_map = true
vim.g.copilot_no_maps = true
vim.g.copilot_assume_mapped = true
map('i', '<C-e>', 'copilot#Accept()', { script = true, expr = true, nowait = true })
