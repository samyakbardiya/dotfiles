-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
    pattern = "ledger",
    callback = function()
        vim.opt_local.omnifunc = "hledger#complete#omnifunc"
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.njk",
    callback = function()
        vim.bo.filetype = "htmldjango"
    end,
})
