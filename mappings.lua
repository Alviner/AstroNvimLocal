local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

if is_available "hop" then
  maps.n["<leader>hw"] = { function() require("hop").hint_words() end, desc = "Hint words" }
  maps.n["<leader>hl"] = { function() require("hop").hint_lines() end, desc = "Hint lines" }
end

if is_available "nvim-dap-python" then
  maps.n["<leader>dt"] = { function() require("dap-python").test_method() end, desc = "Test method" }
  maps.n["<leader>da"] = { function() require("dap-python").test_class() end, desc = "Test class" }
end
if is_available "rayso" then
  maps.v["<leader>rs"] = { function() require("lib.create").create_snippet() end, desc = "Create Code Snippet" }
end
return maps
