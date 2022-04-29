local utils = require('nvim-lsp-setup.utils')

local mappings = {
    gd = "lua require('fzf-lua').lsp_definitions({jump_type='tab'})",
    gi = "lua require('fzf-lua').lsp_implementations({jump_type='tab'})",
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

local settings = {
    default_mappings = false,
    mappings = mappings,
    on_attach = function(client, bufnr)
        utils.format_on_save(client)
    end,
    servers = {
        pyright = {},
        yamlls = {},
        sumneko_lua = require('lua-dev').setup({
            lspconfig = {
                on_attach = function(client, _)
                    utils.disable_formatting(client)
                end,
            },
        }),
        rust_analyzer = require('nvim-lsp-setup.rust-tools').setup({
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
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
        }),
    },
}

require('nvim-lsp-setup').setup(settings)

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua.with({
            extra_args = { '--config-path', vim.fn.expand('~/.config/stylua/stylua.toml') },
        }),
    },
    on_attach = function(client)
        utils.format_on_save(client)
    end,
})

require('lsp_signature').setup({})
require('lsp-colors').setup({})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable underline, it's very annoying
    underline = false,
    -- Disable error message at end of the line
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})
