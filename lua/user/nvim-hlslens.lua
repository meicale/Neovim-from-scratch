local status_ok, hlslens = pcall(require, "hlslens")
if not status_ok then
  print("hlslens is not OK!!!")
  return
end

hlslens.setup()
