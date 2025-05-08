-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "-"

-- vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = false
-- vim.opt.scrolloff = 10
vim.opt.splitright = false
vim.opt.splitbelow = false
vim.opt.tabstop = 4

-- vim.g.ai_cmp = true
-- vim.g.copilot_enabled = false
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/share/pyenv/versions/py3nvim/bin/python3"
vim.g.snacks_animate = false

-- LazyExtras
vim.g.lazyvim_picker = "fzf"
