-- Nvim Treesitter configurations and abstraction layer
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "just",
            "ledger",
        },
    },
}
