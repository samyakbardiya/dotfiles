-- A native neovim extension for Codeium
return {
    {
        "Exafunction/codeium.nvim",
        opts = {
            enable_chat = true,
        },
        config = function(_, opts)
            if vim.g.ai_codeium_enabled then
                require("codeium").setup(opts)
            end
            require("codeium").setup(opts)
            Snacks.toggle({
                name = "Codeium",
                get = function()
                    if not vim.g.ai_codeium_enabled then
                        return false
                    end
                    return require("codeium").is_enabled()
                end,
                set = function(state)
                    if state then
                        require("codeium").setup(opts)
                        require("codeium").enable()
                        vim.g.ai_codeium_enabled = true
                    else
                        require("codeium").disable()
                        vim.g.ai_codeium_enabled = false
                    end
                end,
            }):map("<leader>ux")
        end,
    },
}
