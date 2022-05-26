local status_ok, test = pcall(require, "vim_test")
if not status_ok then
  print("No config vim-test here. Because it maybe a wrong name above.")
  return
end


-- local status_ok, ultest = pcall(require, "ultest")
-- if not status_ok then
--   print("ultest is not ok!")
--   return
-- end
print("you can config vim-test here.")
