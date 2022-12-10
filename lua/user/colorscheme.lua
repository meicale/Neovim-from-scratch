vim.cmd [[
try
 " Important!!
 if has('termguicolors')
   set termguicolors
 endif
  " colorscheme nightfly
  " colorscheme tokyonight
  " colorscheme moonlight
  " The best colorscheme gruvbox.
 " For dark version.
 colorscheme gruvbox-material
 set background=dark
 set background=dark
 highlight Normal guibg=None ctermbg=None
 " For light version.
 " set background=light
 " Set contrast.
 " This configuration option should be placed before `colorscheme gruvbox-material`.
 " Available values: 'hard', 'medium'(default), 'soft'
 let g:gruvbox_material_background = 'hard'
 " For better performance
 let g:gruvbox_material_better_performance = 1
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- vim.cmd [[
-- try
--  " Important!!
--  if has('termguicolors')
--    set termguicolors
--  endif
--  ]]

-- -- It is cool but I just like gruvbox
-- -- https://github.com/folke/tokyonight.nvim/blob/main/extras/tmux_tokyonight_storm.tmux
-- -- Example config in Lua
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- -- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]
