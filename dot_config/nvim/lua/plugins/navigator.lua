-- Smoothly navigate between neovim and terminal multiplexer(s)
return {
    "numToStr/Navigator.nvim",
    config = true,
    keys = {
        { "<C-h>", "<CMD>NavigatorLeft<CR>", mode = { "n", "o", "v" }, remap = true, desc = "Go to left window" },
        { "<C-j>", "<CMD>NavigatorDown<CR>", mode = { "n", "o", "v" }, remap = true, desc = "Go to down window" },
        { "<C-k>", "<CMD>NavigatorUp<CR>", mode = { "n", "o", "v" }, remap = true, desc = "Go to up window" },
        { "<C-l>", "<CMD>NavigatorRight<CR>", mode = { "n", "o", "v" }, remap = true, desc = "Go to right window" },
    },
}
