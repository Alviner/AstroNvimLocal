local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

if is_available "nvim-dap-python" then
  maps.n["<leader>dt"] = { function() require("dap-python").test_method() end, desc = "Test method" }
end

if is_available "rayso" then
  maps.v["<leader>rs"] = { function() require("lib.create").create_snippet() end, desc = "Create Code Snippet" }
end

if is_available "flash" then
  maps.n["<leader>hw"] = {
    function()
      require("flash").jump {
        search = {
          mode = function(str) return "\\<" .. str end,
        },
      }
    end,
    desc = "Hint word",
  }
  maps.n["<leader>hl"] = {
    function()
      require("flash").jump {
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^",
      }
    end,
    desc = "hint word",
  }
  maps.n["<leader>ht"] = {
    function() require("flash").treesitter_search() end,
    desc = "hint treesitter",
  }
end

vim.g.copilot_assume_mapped = true
maps.i["<C-.>"] = { function() vim.fn.feedkeys(vim.fn["copilot#Accept"](), "") end, desc = "Copilot Accept" }
maps.n["<C-.>"] = { "<cmd>Copilot panel<cr>", desc = "Copilot open panel" }

return maps
