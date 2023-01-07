local status_ok, im_select = pcall(require, "which-key")
if not status_ok then
  print("im_select is not ok!!!")
  return
end

-- ref: https://www.cnblogs.com/tuilk/p/16421831.html
-- 设置 im-select 的路径
vim.g.im_select_command = "/mnt/i/Win_User/rime_user/im-select.exe"
-- normal 模型下采用英文输入法
vim.g.im_select_default = "1033"
-- 如果您的桌面已经开启“在不同的窗口/应用程序之间切换输入法”的功能，可能需要将此选项设置为 0
vim.g.im_select_enable_focus_events = 0


  -- augroup illuminate_augroup
  --     autocmd!
  --     autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
  -- augroup END


-- vim.cmd [[

local augroup = vim.api.nvim_create_augroup
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	command = 'silent exec "!(/mnt/i/Win_User/rime_user/im-select.exe) &"',
	group = cursorGrp,
})

vim.api.nvim_create_autocmd("VimEnter", {
 	pattern = "*",
 	command = 'silent exec "!(/mnt/i/Win_User/rime_user/im-select.exe) &"',
 	group = cursorGrp,
})

-- ]]

