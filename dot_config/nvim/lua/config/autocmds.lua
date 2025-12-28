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

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("lazyvim_wrap_spell", { clear = true }),
    pattern = { "text", "plaintex", "tex", "typst", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt_local.wrapmargin = 0
        vim.opt_local.linebreak = true
    end,
})
