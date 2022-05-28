local status_ok, ultest = pcall(require, "ultest")
if not status_ok then
  print("ultest is not ok!")
  return
end
-- print("config ultest")
-- this is for ultest
vim.cmd [[
    nmap ]t <Plug>(ultest-next-fail)
    nmap [t <Plug>(ultest-prev-fail)
    let test#python#pytest#options = "--color=yes"
    let g:ultest_use_pty = 1
]]
