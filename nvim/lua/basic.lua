-- basic
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.history = 2000 -- how many lines of history VIM has to remember
vim.o.autoread = true -- auto reload when a file is changed from the outside
vim.o.shortmess = vim.o.shortmess .. 'c' -- make messages shorter. see (:help: shortmess)
vim.o.magic = true -- turn magic on for regular expressions
vim.o.backup = false -- do not keep a backup file
vim.o.writebackup = false -- do not keep a backup file
vim.o.swapfile = false -- do not keep a backup file
vim.o.timeoutlen = 500 -- time out on mapping after 0.5 seconds

-- no annoying sound on errors
vim.o.visualbell = false -- turn off visual bell
vim.o.errorbells = false -- don't beep

-- location cursor style
vim.o.cursorcolumn = true
vim.o.cursorline = true

-- movement
vim.o.scrolloff = 8 -- keep 8 lines when scrolling

-- show
vim.o.ruler = true -- show the current row and column
vim.o.number = true -- show line numbers
vim.o.showcmd = true -- display incomplete commands

-- search
vim.o.hlsearch = false -- highlight searches
vim.o.incsearch = true -- do incremental searching, search as you type
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- no ignorecase if uppercase char present

-- encoding
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8'
vim.o.termencoding = 'utf-8'

-- complete
vim.g.completeopt = 'menu,menuone,noselect,noinsert'
vim.o.wildmenu = true

-- others
vim.o.backspace = 'indent,eol,start' -- make backspace key act the way it should
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l' -- let backspace, h and l keys work across lines

-- instead tab with 4 spaces
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- enhanced indent configs
vim.o.autoindent = true
vim.o.shiftwidth = 4 -- spaces for indent
vim.o.shiftround = true -- count your spaces while indent by '<' or '>'

-- autocmd
vim.cmd(
    [[autocmd FileType ruby,php,coffee,javascript,typescript,html,htmldjango,xhtml,haml,sass,scss,css,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2]]
)
vim.cmd([[autocmd FileType nginx setlocal iskeyword-=:]])
vim.cmd([[autocmd FileType yaml setlocal nowrap]])
vim.cmd([[autocmd BufRead,BufNewFile *.conf set filetype=conf]])
vim.cmd([[autocmd BufRead,BufNewFile *.envrc set filetype=sh]])
vim.cmd([[autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby]])
-- return to last edit position when opening files
-- if this not work, make sure .viminfo is writable for you
vim.cmd([[
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exec "normal g`\"" |
    \ endif
]])
