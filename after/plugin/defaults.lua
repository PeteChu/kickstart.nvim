vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.swapfile = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.cmd [[
    syntax on
    filetype plugin indent on
]]
