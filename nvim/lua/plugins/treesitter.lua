require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'go', 'python' },

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        enable = true,

        -- list of language that will be disabled
        -- disable = { 'lua' },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,

        -- RRethy/nvim-treesitter-endwise
        endwise = { enable = true },
    },
})
