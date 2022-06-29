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
