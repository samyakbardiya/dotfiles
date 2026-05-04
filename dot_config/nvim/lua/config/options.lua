-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.o.clipboard = "unnamedplus"
-- vim.o.cursorcolumn = true
vim.o.number = true
vim.o.relativenumber = false
-- vim.o.scrolloff = 10
vim.o.splitright = false
vim.o.splitbelow = false
vim.o.tabstop = 4

vim.g.ai_cmp = true
vim.g.copilot_enabled = false
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/share/pyenv/versions/py3nvim/bin/python3"
vim.g.snacks_animate = false

-- LazyExtras
vim.g.lazyvim_picker = "fzf"

-- Clipboard over SSH
if os.getenv("SSH_TTY") or os.getenv("SSH_CLIENT") then
    vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            local regcontents = vim.v.event.regcontents
            require("vim.ui.clipboard.osc52").copy("+")(regcontents)
            require("vim.ui.clipboard.osc52").copy("*")(regcontents)
            -- local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
            -- copy_to_unnamedplus(regcontents)
            -- local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
            -- copy_to_unnamed(regcontents)
        end,
    })
end
