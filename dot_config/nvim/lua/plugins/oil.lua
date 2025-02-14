-- Neovim file explorer: edit your filesystem like a buffer
return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        default_file_explorer = true,
        column = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
        },
    },
    keys = {
        {
            "<leader>fo",
            function()
                require("oil").toggle_float()
            end,
            desc = "Open oil (parent directory)",
        },
    },
}
