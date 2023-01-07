local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt is not OK!!!")
	return
end

chatgpt.setup({
  -- optional configuration
})
