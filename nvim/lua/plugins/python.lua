return {
    lsp = {
        "alexpasmantier/pymple.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim"
        },
        build = ":PympleBuild",
        config = function()
            require("pymple").setup({ auto_apply = true })
        end,
    },
}
