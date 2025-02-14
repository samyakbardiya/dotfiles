-- A Neovim plugin hiding your colorcolumn when unneeded.
return {
    "m4xshen/smartcolumn.nvim",
    opts = {
        colorcolumn = "80",
        custom_colorcolumn = {
            java = "120",
            python = "100",
        },
        disabled_filetypes = {
            "NvimTree",
            "Trouble",
            "alpha",
            "checkhealth",
            "dashboard",
            "fish",
            "harpoon",
            "help",
            "lazy",
            "lazyterm",
            "lspinfo",
            "mason",
            "neo-tree",
            "noice",
            "notify",
            "toggleterm",
            "trouble",
            "zsh",
        },
    },
}
-- 3456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 1
