local utils = require('utils')

local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.75,
                height = 0.5,
            },
        },
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-l>'] = { '<Right>', type = 'command' },
                ['<C-h>'] = { '<Left>', type = 'command' },
                ['<C-f>'] = actions.preview_scrolling_down,
                ['<C-b>'] = actions.preview_scrolling_up,
            },
        },
    },
})
require('telescope').load_extension('gh')
require('telescope').load_extension('packer')
utils.map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
utils.map('n', '<c-f>', '<cmd>Telescope live_grep<cr>')
