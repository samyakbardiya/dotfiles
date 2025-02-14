-- neovim undotree written in lua
return {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
        {
            "<leader>uu",
            function()
                require("undotree").toggle()
            end,
            desc = "Toggle Undotree",
        },
    },
}
