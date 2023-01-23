require'nvim-treesitter.configs'.setup {
  markid = { enable = true }
}

-- this doesnot work
-- local status_ok, markid = pcall(require, "markid")
-- if not status_ok then
--   print("markid is not ok!!!")
--   return
-- end

