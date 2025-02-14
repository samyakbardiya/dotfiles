-- Improved fzf.vim written in lua
return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {
        winopts = {
            height = 0.95, -- window height
            width = 0.95, -- window width
            -- fullscreen = false,
        },
        files = {
            git_icons = true,
            cwd_prompt = true,
            cwd_prompt_shorten_len = 16, -- shorten prompt beyond this length
        },
    },
}
