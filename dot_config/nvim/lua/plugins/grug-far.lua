-- Find And Replace plugin for neovim
return {
    "MagicDuck/grug-far.nvim",
    opts = {
        headerMaxWidth = 80,
        openTargetWindow = {
            preferredLocation = "prev",
        },
    },
    cmd = "GrugFar",
}
