return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "day", -- day, storm, night, or moon
        })
        vim.cmd("colorscheme tokyonight-day")
    end
}
