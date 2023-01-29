local status_ok, sg = pcall(require, "sg")
if not status_ok then
  print("sg is not ok!:")
  return
end

-- -- Setup the LSP server to attach when you edit an sg:// buffer
-- require("sg").setup {
--   -- Pass your own custom attach function
--   --    If you do not pass your own attach function, then the following maps are provide:
--   --        - gd -> goto definition
--   --        - gr -> goto references
--   on_attach = your_custom_lsp_attach_function
-- }

-- " Example mapping for doing searches from within neovim (may change)
-- nnoremap <space>ss <cmd>lua require('sg.telescope').fuzzy_search_results()<CR>
