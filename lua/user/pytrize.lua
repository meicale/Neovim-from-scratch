local status_ok, pytrize = pcall(require, "pytrize")
if not status_ok then
  print("pytrize is not ok!:")
  return
end

pytrize.setup()
