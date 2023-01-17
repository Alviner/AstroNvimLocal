local is_available = astronvim.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

if is_available "hop.nvim" then
  maps.n["<leader>hw"] = { function() require"hop".hint_words() end, desc = "Hint words" }
  maps.n["<leader>hl"] = { function() require"hop".hint_lines() end, desc = "Hint lines" }
end

if is_available "nvim-dap-python" then
  maps.n["<leader>DT"] = { function() require"dap-python".test_method() end, desc = "Test method"}
  maps.n["<leader>DC"] = { function() require"dap-python".test_class() end, desc = "Test class"}
end
return maps
