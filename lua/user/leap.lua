local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
require('leap').add_default_mappings() 
