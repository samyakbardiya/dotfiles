-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

vim.keymap.set("n", "<leader>Qr", "<cmd>source %<cr>", { desc = "Reload current file" })
vim.keymap.set("n", "<leader>QR", "<cmd>source $XDG_CONFIG_HOME/nvim/init.lua<cr>", { desc = "Reload Neovim config" })

vim.keymap.set("n", "<leader><CR>", LazyVim.pick("files", { root = false, desc = "Find Files (cwd)" }))
