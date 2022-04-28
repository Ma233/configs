local utils = require('nvim-lsp-setup.utils')

local mappings = {
    gd = 'lua require"telescope.builtin".lsp_definitions({jump_type="tab"})',
    gi = 'lua require"telescope.builtin".lsp_implementations({jump_type="tab"})',
    gr = 'lua require"telescope.builtin".lsp_references()',
}

local settings = {
    mappings = mappings,
    on_attach = function(client, bufnr)
        utils.format_on_save(client)
    end,
    servers = {
        pyright = {},
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

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
