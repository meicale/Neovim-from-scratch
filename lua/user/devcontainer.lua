local status_ok, devcontainer = pcall(require, "devcontainer")
if not status_ok then
  print("devcontainer is not OK!!!")
  return
end

devcontainer.setup{}

print("devcontainer setted up!!!")
