local dvorak_labels = "aoeuidhtnspyfgcrlqjkxbwvz"

-- Navigate your code with search labels, enhanced character motions and Treesitter integration
return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        labels = dvorak_labels,
        modes = {
            treesitter = {
                labels = dvorak_labels,
            },
        },
        label = {
            exclude = "cdxyCDXY",
        },
    },
}
