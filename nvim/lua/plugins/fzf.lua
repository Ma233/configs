local utils = require('utils')

utils.map('n', '<c-p>', "<cmd>lua require('fzf-lua').files()<CR>")
utils.map('n', '<c-f>', "<cmd>lua require('fzf-lua').grep()<CR>")
utils.map('v', '<c-f>', "y<cmd>lua require('fzf-lua').grep()<CR><C-r>0<CR>")
