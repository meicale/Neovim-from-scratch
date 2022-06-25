local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  print("illuminate is not ok!:")
  return
end

require'lspconfig'.gopls.setup {
  on_attach = function(client)
    -- [[ other on_attach code ]]
    require 'illuminate'.on_attach(client)
  end,
}

vim.cmd [[
  augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
  augroup END
]]
