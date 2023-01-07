local status_ok, betterescape = pcall(require, "better_escape")
if not status_ok then
  print("better_escape is not OK!!!")
  return
end
betterescape.setup()
