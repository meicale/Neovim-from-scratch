-- vim plugin don't need pcall
-- local status_ok, sandwich pcall(require, "vim-sandwich")
-- if not status_ok then
--   print("vim-sandwich is NOT ok!")
-- 	return
-- end

vim.cmd[[
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes) 
]]
