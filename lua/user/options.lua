local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 170, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  cursorcolumn = true, -- highlight the current column
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- -- https://github.com/ruanyl/vim-gh-line
-- -- this doesn't work.
-- vim.cmd [[
-- let g:gh_line_map_default = 0
-- let g:gh_line_blame_map_default = 1
-- let g:gh_line_map = '<leader>gl'
-- " let g:gh_line_blame_map = '<leader>gb'
-- " g:gh_open_command = 'open '
-- " Copy link to a clipboard instead of opening a browser:
-- let g:gh_open_command = 'fn() { echo "$@"; }; fn '
-- " let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
-- " Use canonical version hash for url in place of branch name:
-- let g:gh_use_canonical = 1
-- ]]

-- https://github.com/mg979/vim-visual-multi/wiki/Mappings 
vim.cmd [[let g:VM_leader = ";"]]

vim.cmd [[
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/home/guanghua/.conda/envs/aacd_test/bin/python'
" let g:python3_host_prog = '/home/guanghua/.conda/envs/aacd/bin/python'
let test#strategy = {
  \ 'nearest': 'asyncrun',
  \ 'file':    'basic',
  \ 'suite':   'basic',
\}
let test#neovim#term_position = "belowright"
let g:test#preserve_screen = 1
let g:ultest_use_pty = 1
let test#python#runner = 'pytest'
" Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'
let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
" let test#project_root = "./tests/test_ops" 
let test#project_root = "./tests/test_training_ops" 
" This is just for aacd project
" https://github.com/vim-test/vim-test  # Working directory

]]
-- auto highlight other uses of current word under cursor.
vim.cmd [[
  augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
  augroup END
]]

vim.cmd([[
  let g:ultest_deprecation_notice = 0
]])

-- https://github.com/skywind3000/asyncrun.vim
vim.cmd([[
  let g:asyncrun_open = 10
  let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
]])
