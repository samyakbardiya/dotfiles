-- Neovim plugin to manage the file system and other tree like structures.
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        filesystem = {
            -- bind_to_cwd = true,
            filtered_items = {
                hide_dotfiles = false,
                hide_by_name = {
                    ".git",
                    "node_modules",
                },
                always_show_by_pattern = {
                    "*do.*",
                    ".env*",
                },
            },
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        -- window = { position = "right" },
    },
}
