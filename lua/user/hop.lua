local status_ok, hop = pcall(require, "hop")
if not status_ok then
  print("hop is not ok!:")
  return
end

-- you can configure Hop the way you like here; see :h hop-config
hop.setup({
  -- keys = "etovxqpdygfblzhckisuran",
  keys = "asdfjkl;ghtrewqyuiopvbcxznm",
  multi_windows = true,
  quit_key = '<SPC>',
})
