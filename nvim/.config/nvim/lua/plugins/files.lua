local keymaps = {
    { "<leader>e", function() Snacks.explorer.toggle() end },
    { "<leader>ef", function() Snacks.explorer.reveal() end },
    { "<leader>ff", function() Snacks.picker.files() end },
    { "<leader>fg", function() Snacks.picker.grep() end },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end }
}


return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        picker = { enabled = true },
        explorer = { enabled = true },
    },
    keys = keymaps
}
