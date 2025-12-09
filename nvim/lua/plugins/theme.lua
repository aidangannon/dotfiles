return {
  dark = {
    "RRethy/base16-nvim",
    config = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#666666" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "#000000" })
      require('base16-colorscheme').setup({
        base00 = '#000000',
        base01 = '#000000',
        base02 = '#2d2d2d',
        base03 = '#666666',
        base04 = '#cccccc',
        base05 = '#ffffff',
        base06 = '#ffffff',
        base07 = '#ffffff',
        base08 = '#ffffff',
        base09 = '#F9F1A5',
        base0A = '#61D6D6',
        base0B = '#16C60C',
        base0C = '#3B78FF',
        base0D = '#3B78FF',
        base0E = '#F9F1A5',
        base0F = '#16C60C',
      })
    end
  },
  
  blue = {
    "RRethy/base16-nvim",
    config = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = "#0000BF" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0000BF" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0000BF" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#FFFF55" })
      vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#AAAAAA" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#0000BF" })
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#0000BF" })
      vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "#0000BF" })
      require('base16-colorscheme').setup({
        base00 = '#0000BF',
        base01 = '#0000CC',
        base02 = '#5555FF',
        base03 = '#AAAAAA',
        base04 = '#DDDDDD',
        base05 = '#FFFFFF',
        base06 = '#FFFFFF',
        base07 = '#FFFFFF',
        base08 = '#FFFFFF',
        base09 = '#FFFF55',
        base0A = '#55FFFF',
        base0B = '#55FF55',
        base0C = '#FF55FF',
        base0D = '#55FFFF',
        base0E = '#FFFF55',
        base0F = '#55FF55',
      })
    end
  },

  light = {
    "RRethy/base16-nvim",
    config = function()
      require('base16-colorscheme').setup({
        base00 = '#FFFFFF',
        base01 = '#FFFFFF',
        base02 = '#E5E5E5',
        base03 = '#CCCCCC',
        base04 = '#333333',
        base05 = '#000000',
        base06 = '#000000',
        base07 = '#000000',
        base08 = '#000000',
        base09 = '#CC9900',
        base0A = '#008B8B',
        base0B = '#0A8A00',
        base0C = '#0066CC',
        base0D = '#0066CC',
        base0E = '#CC9900',
        base0F = '#0A8A00',
      })
      vim.api.nvim_set_hl(0, "Normal", { bg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#000000" })
      vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#999999" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "#FFFFFF" })
    end
  }
}
