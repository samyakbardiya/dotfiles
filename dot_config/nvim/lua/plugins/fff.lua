return {
    "dmtrKovalenko/fff.nvim",
    lazy = false,
    build = function()
        require("fff.download").download_or_build_binary()
    end,
    opts = {
        layout = {
            height = 0.9,
            width = 0.9,
            prompt_position = "top",
        },
        git = {
            status_text_color = true,
        },
        file_picker = {
            fuzzy_query_highlighting = true,
        },
        debug = {
            enabled = true,
            show_scores = true,
            show_file_info = {
                file_info = true,
                score_breakdown = false,
                timings = false,
                full_path = true,
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "<leader><space>", function() require("fff").find_files() end, desc = "FFFind files", },
        { "<leader>/", function() require("fff").live_grep() end, desc = "LiFFFe grep", },
        { "<leader>s-", function() require("fff").resume() end, desc = "Resume FFFind" },
        { "fz", function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end, desc = "Live fffuzy grep", },
        { "fc", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, desc = "Search current word", },
    },
}
