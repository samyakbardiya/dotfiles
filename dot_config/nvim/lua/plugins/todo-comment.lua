-- ✅ Highlight, list and search todo comments in your projects
return {
    "folke/todo-comments.nvim",
    opts = {
        keywords = {
            TODO = { icon = " ", color = "info", alt = { "[ ]", "[]" } },
            DONE = { icon = " ", color = "hint", alt = { "[X]", "[x]" } },
        },
    },
}
