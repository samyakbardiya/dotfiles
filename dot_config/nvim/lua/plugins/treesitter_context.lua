-- Show code context
return {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
        max_lines = 15, -- How many lines the window should span. Values <= 0 mean no limit.
        multiline_threshold = 2, -- Maximum number of lines to show for a single context
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
}
