-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- location cursor
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

-- keep 8 lines when scrolling
vim.o.scrolloff = 8

-- remove not using lazyvim default configs
vim.opt.relativenumber = false
vim.opt.clipboard = ""
