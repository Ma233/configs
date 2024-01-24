local utils = require('lsp-setup.utils')

local mappings = {
    gd = "lua require('fzf-lua').lsp_definitions()",
    gt = "lua require('fzf-lua').lsp_typedefs()",
    gi = "lua require('fzf-lua').lsp_implementations()",
    gr = "lua require('fzf-lua').lsp_references()",
    ['<space><space>'] = 'lua vim.lsp.buf.signature_help()',
    ['<space>k'] = 'lua vim.lsp.buf.hover()',
    ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
    ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
    [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
    ['<C-j>'] = 'lua vim.diagnostic.goto_next()',
    ['<C-k>'] = 'lua vim.diagnostic.goto_prev()',
}

require('neodev').setup()

require('lsp-setup').setup({
    default_mappings = false,
    mappings = mappings,
    on_attach = function(client, _)
        utils.format_on_save(client)
    end,
    servers = {
        pyright = {},
        yamlls = {},
        eslint = {},
        tsserver = {
            lspconfig = {
                on_attach = function(client, _)
                    utils.disable_formatting(client)
                end,
            },
        },
        bashls = {},
        lua_ls = {},
        gopls = {},
        -- bufls = {},
        -- clangd = {},
        ['rust_analyzer@nightly'] = {
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        loadOutDirsFromCheck = true,
                        -- features = { 'ffi' },
                        -- features = { 'dummy' },
                        -- features = { 'wasm' },
                        features = { 'browser' },
                    },
                    rustfmt = {
                        extraArgs = { '+nightly' },
                    },
                    procMacro = {
                        enable = true,
                    },
                    checkOnSave = {
                        command = 'clippy',
                    },
                },
            },
        },
    },
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.reorder_python_imports,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.trim_whitespace.with({ disabled_filetypes = { 'lua', 'python', 'rust' } }),
        null_ls.builtins.formatting.trim_newlines.with({ disabled_filetypes = { 'lua', 'python', 'rust' } }),
        null_ls.builtins.formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.expand('~/.config/stylua/stylua.toml', nil, nil) },
        }),
    },
    on_attach = function(client)
        utils.format_on_save(client)
    end,
})

require('lsp_signature').setup({})
require('lsp-colors').setup({})
require('fidget').setup({})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable underline, it's very annoying
    underline = false,
    -- Disable error message at end of the line
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})
