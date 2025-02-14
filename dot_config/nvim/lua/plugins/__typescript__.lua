return {

    -- -- Neovim plugin to format tsserver LSP errors
    -- {
    --     "davidosomething/format-ts-errors.nvim",
    -- },

    -- -- for turning messy and confusing TypeScript errors into plain English.
    -- {
    --     "dmmulroy/ts-error-translator.nvim",
    -- },

    -- better formatted TypeScript errors
    {
        "OlegGulevskyy/better-ts-errors.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = {
            keymaps = {
                toggle = "<leader>cp",
                go_to_definitation = "<leader>c.",
            },
        },
    },

    --  Use treesitter to auto close and auto rename html tag
    {
        "nvim-ts-autotag",
    },
}
