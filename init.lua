-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  colorscheme = "catppuccin",
  plugins = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "lua",
          "python",
          "go",
          "vue",
          "javascript",
          "yaml",
          "json",
          "css",
          "hcl",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "html",
          "jsonls",
          "cssls",
          "dockerls",
          "marksman",
          "vuels",
          "yamlls",
        },
      },
    },
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {

        ensure_installed = {
          "prettier",
          "stylua",
          "jq",
          "markdownlint",
          "mypy",
          "vimt",
        },
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = { -- overrides `require("mason-nvim-dap").setup(...)`
        ensure_installed = { "python", "go" },
      },
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
    },
    {
      "folke/flash.nvim",
      name = "flash",
      event = "VeryLazy",
      opts = {
        modes = {
          treesitter_search = {
            jump = { pos = "start" },
            search = { incremental = true },
          },
        },
      },
      keys = {},
    },
    {
      "TobinPalmer/rayso.nvim",
      name = "rayso",
      config = function()
        require("rayso").setup {
          options = {
            theme = "candy",
          },
        }
      end,
    },
    {
      "github/copilot.vim",
      cmd = "Copilot",
      name = "copilot",
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").test_runner = "pytest"

        require("dap-python").resolve_python = function() return "python" end

        local pytest = require("dap-python").test_runners.pytest
        require("dap-python").test_runners.pytest = function(...)
          local module, args = pytest(...)
          table.insert(args, "-vv")
          return module, args
        end
        require("dap-python").setup "python"
      end,
      lazy = true,
    },
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        require "plugins.configs.luasnip"(plugin, opts)
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } }
      end,
    },
  },
}

return config
