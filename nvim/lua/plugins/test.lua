return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "Issafalcon/neotest-dotnet",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          runner = "pytest",
          python = "venv/bin/python",  -- Path to your venv python
          args = { "--rootdir=.", "-c", "pyproject.toml" }
        }),
        require("neotest-dotnet")({
          dap = { justMyCode = false },
        }),
      }
    })
  end,
}
