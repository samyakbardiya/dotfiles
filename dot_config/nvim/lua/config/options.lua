-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = "-"

-- vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.splitright = false
vim.opt.splitbelow = false
-- vim.opt.scrolloff = 10

vim.opt.tabstop = 4

-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/share/pyenv/versions/py3nvim/bin/python3"
vim.g.snacks_animate = false
