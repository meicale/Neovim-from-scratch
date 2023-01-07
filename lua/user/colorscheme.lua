local colorscheme = "gruvbox-material"
-- local colorscheme =  "kanagawa"
-- local colorscheme = "catppuccin" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- local colorscheme = "tokyonight"
-- local colorscheme ="nightfox"

if colorscheme == "gruvbox-material" then
vim.cmd [[
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_background = 'soft'
set background=dark
]]
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
