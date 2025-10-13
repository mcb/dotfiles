local vim = vim -- suppress lsp warnings
local o = vim.opt

o.clipboard = 'unnamedplus'   -- use system clipboard 
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.wrap = false
o.autoread = true
o.list = true -- show trailing characters
o.signcolumn = "yes"
o.number = true               -- show line numbers
o.cursorline = true           -- highlight cursor line
o.backspace = "indent,eol,start"
o.shell = "/bin/zsh"
o.colorcolumn = "100"
o.completeopt = { "menuone", "noselect", "popup" }
o.wildmode = { "lastused", "full" }
o.pumheight = 15
o.laststatus = 0
o.winborder = "rounded"
o.undofile = true
o.ignorecase = true           -- ignore case in searches by default
o.smartcase = true            -- make it case sensitive if an uppercase is entered
o.swapfile = false
o.foldmethod = "indent"
o.foldlevelstart = 99
o.grepprg = "rg --vimgrep --smart-case --hidden"
o.grepformat = "%f:%l:%c:%m"

vim.g.mapleader = ","
vim.g.maplocalleader = ","
