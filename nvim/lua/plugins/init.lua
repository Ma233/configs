local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path, nil, nil, nil)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
end

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- common requirements
    use('nvim-lua/plenary.nvim')
    use('kyazdani42/nvim-web-devicons')

    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('plugins.colorizer')
        end,
    })

    use({
        'Mofiqul/dracula.nvim',
        config = function()
            require('plugins.theme')
        end,
    })
    use({
        'hoob3rt/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end,
    })
    use({
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.bufferline')
        end,
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'RRethy/nvim-treesitter-endwise',
        },
        config = function()
            require('plugins.treesitter')
        end,
    })

    use({
        'Ma233/Mark--Karkat',
        config = function()
            require('plugins.mark')
        end,
    })

    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-abolish')
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('plugins.autopairs')
        end,
    })

    use({
        'ibhagwan/fzf-lua',
        config = function()
            require('plugins.fzf')
        end,
    })

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'hrsh7th/cmp-buffer',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('plugins.cmp')
        end,
    })
    use({
        'github/copilot.vim',
        setup = function()
            require('plugins.copilot')
        end,
    })

    use({
        'junnplus/nvim-lsp-setup',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/nvim-lsp-installer',
            'hrsh7th/cmp-nvim-lsp',
            'ray-x/lsp_signature.nvim',
            'folke/lsp-colors.nvim',
            'folke/lua-dev.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'simrat39/rust-tools.nvim',
            'j-hui/fidget.nvim',
            'p00f/clangd_extensions.nvim',
        },
        config = function()
            require('plugins.lsp')
        end,
    })

    use({
        'numToStr/Comment.nvim',
        config = function()
            require('plugins.comment')
        end,
    })

    use({
        'folke/which-key.nvim',
        config = function()
            require('plugins.whichkey')
        end,
    })
end)
