-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- fix up command mode like a terminal
vim.keymap.set("c", "<C-n>", "<t_kd>")
vim.keymap.set("c", "<C-p>", "<t_ku>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")

-- make Y behave like other capitals
vim.keymap.set("n", "Y", "y$")

-- escape the line break
vim.keymap.set("v", "$", "$h")

-- copy to os clipboard
vim.keymap.set("v", "<C-c>", '"+y')

-- diagnostics
vim.keymap.set("n", "<leader><space>", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- remove not using keymaps of lazyvim
vim.keymap.del("n", "<A-j>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
