local map = require('utils').map
vim.g.copilot_no_tab_map = true
vim.g.copilot_no_maps = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_node_command = '/Users/magine/.volta/tools/image/node/17.4.0/bin/node'
vim.g.copilot_proxy = '127.0.0.1:7890'
map('i', '<C-e>', 'copilot#Accept()', { script = true, expr = true, nowait = true })
