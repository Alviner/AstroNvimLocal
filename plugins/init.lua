return {
  ["catppuccin/nvim"] = { as = "catppuccin" },
  ["phaazon/hop.nvim"] = {
    as = "hop",
    branch = "v2",
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  },
  ["mfussenegger/nvim-dap-python"] = {
    config = function()
      require("dap-python").setup "~/.pyenv/shims/python"
      require("dap-python").test_runner = "pytest"
    end,
    after = "nvim-dap",
  },
}
