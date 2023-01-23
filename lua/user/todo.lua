local M = {}
-- TODO: just for test
-- https://www.youtube.com/watch?v=PdaObkGazoU
M.todo = function ()
-- TODO use todo followed by ":" to be the pattern
  local query_string = '((comment) @comment (#match? @comment "TODO"))'
  local parser = require('nvim-treesitter.parsers').get_parser()
  local ok, query = pcall(vim.treesitter.query.parse_query, parser:lang(), query_string)
  if not ok then return end
  local tree = parser:parse()[1]
  local qf_list = {}
  -- TODO to search all the files in the project
  for _, n in query:iter_captures(tree:root(),0) do
    local text = vim.treesitter.query.get_node_text(n, 0)
    local lnum, col = n:range()
    table.insert(qf_list, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = text,
      lnum = lnum + 1,
      col = col + 1
    })
  end
  vim.fn.setqflist(qf_list)
  vim.cmd.copen()
end
return M
-- todo just end of the file


