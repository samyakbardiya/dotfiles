-- Snippet Engine for Neovim written in Lua.
return {
    "L3MON4D3/LuaSnip",

    -- opts = {
    --     keep_roots = true,
    --     link_roots = true,
    --     link_children = true,
    --     update_events = { "TextChanged", "TextChangedI" },
    --     delete_check_events = { "TextChanged" },
    -- },

    -- config = function()
    --     -- opts = opts or {}
    --     -- opts.keep_roots = true
    --     -- opts.link_roots = true
    --     -- opts.link_children = true
    --     -- opts.update_events = { "TextChanged", "TextChangedI" }
    --     -- opts.delete_check_events = { "TextChanged" }
    --
    --     local ls = require("luasnip")
    --     local s = ls.snippet
    --     local sn = ls.snippet_node
    --     local isn = ls.indent_snippet_node
    --
    --     local t = ls.text_node
    --     local i = ls.insert_node
    --     local f = ls.function_node
    --     local c = ls.choice_node
    --     local d = ls.dynamic_node
    --     local r = ls.restore_node
    --     local events = require("luasnip.util.events")
    --     local ai = require("luasnip.nodes.absolute_indexer")
    --     local extras = require("luasnip.extras")
    --     local l = extras.lambda
    --     local rep = extras.rep
    --     local p = extras.partial
    --     local m = extras.match
    --     local n = extras.nonempty
    --     local dl = extras.dynamic_lambda
    --     local fmt = require("luasnip.extras.fmt").fmt
    --     local fmta = require("luasnip.extras.fmt").fmta
    --     local conds = require("luasnip.extras.expand_conditions")
    --     local postfix = require("luasnip.extras.postfix").postfix
    --     local types = require("luasnip.util.types")
    --     local parse = require("luasnip.util.parser").parse_snippet
    --     local ms = ls.multi_snippet
    --     local k = require("luasnip.nodes.key_indexer").new_key
    --
    --     ls.setup({
    --         keep_roots = true,
    --         link_roots = true,
    --         link_children = true,
    --         update_events = { "TextChanged", "TextChangedI" },
    --         delete_check_events = { "TextChanged" },
    --         enable_autosnippets = true,
    --     })
    --
    --     ls.filetype_extend("dart", { "flutter" })
    --
    --     ls.add_snippets("all", {
    --         s("lol", fmt({ t("lallu('"), i(1), t("')") })),
    --         s("logfac", {
    --             t("private static final Logger log = LoggerFactory.getLogger("),
    --             -- f(function(_, snip)
    --             --     return snip.env.TM_FILENAME_BASE
    --             -- end, {}),
    --             t(".class);"),
    --         }),
    --     }, {
    --         key = "all",
    --     })
    -- end,

    keys = {
        {
            "<C-k>",
            function()
                return require("luasnip").jumpable(1) and require("luasnip").jump(1)
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
        {
            "<C-k>",
            function()
                require("luasnip").jump(1)
            end,
            mode = "s",
        },
        {
            "<C-j>",
            function()
                require("luasnip").jump(-1)
            end,
            mode = { "i", "s" },
        },
        {
            "<leader>Qs",
            "<CMD>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>",
            desc = "Reload LuaSnip",
        },
    },
}
