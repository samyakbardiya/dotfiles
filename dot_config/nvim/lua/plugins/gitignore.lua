-- A neovim plugin for generating .gitignore files.
return {
    "wintermute-cell/gitignore.nvim",
    config = function()
        require("gitignore")
    end,
    keys = {
        {
            "<leader>g.",
            function()
                require("gitignore").generate({})
            end,
            desc = "Generate .gitignore file",
        },
    },
}
