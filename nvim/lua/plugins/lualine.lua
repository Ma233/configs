require('lualine').setup({
    options = {
        theme = 'dracula-nvim',
    },
    extensions = { 'fzf' },
    sections = {
        lualine_c = { { 'filename', file_status = true, path = 1, shorting_target = 40 } },
    },
})
