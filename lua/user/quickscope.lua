-- this plugin may just for vim can have no lua model.
local status_ok, quickscope = pcall(require, "quickscope")
if not status_ok then
  print("quick-scope is not OK!!!")
	return
end

print("configing quickscope has done")
