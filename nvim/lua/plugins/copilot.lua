local M = {}
local map = require('utils').map

function M.setup()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_no_maps = true
    vim.g.copilot_assume_mapped = true
end

function M.config()
    map('i', '<C-e>', 'copilot#Accept()', { expr = true })
end

return M
