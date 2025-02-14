--  Portable package manager for Neovim that runs everywhere Neovim runs.
return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "gitui",
        },
    },
    keys = {
        {
            "<leader>gU",
            function()
                Snacks.terminal({ "gitui" })
            end,
            desc = "GitUi (cwd)",
        },
        {
            "<leader>gu",
            function()
                Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.get() })
            end,
            desc = "GitUi (Root Dir)",
        },
    },
}
