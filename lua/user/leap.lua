local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap is not OK!!!")
  return
end
require('leap').add_default_mappings() 
