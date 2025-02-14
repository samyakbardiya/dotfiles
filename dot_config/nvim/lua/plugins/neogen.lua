-- A better annotation generator. Supports multiple languages and annotation conventions.
return {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        {
            "<leader>cg",
            function()
                require("neogen").generate()
            end,
            desc = "Generate docstring",
        },
    },
}
