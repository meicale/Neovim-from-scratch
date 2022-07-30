local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- -- Better movement with hop
-- -- place this in one of your configuration file(s)
-- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'jw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('v', 'jw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('o', 'jw', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'jr', "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('v', 'jr', "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('o', 'jr', "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'jf', "<cmd> lua require'hop'.hint_patterns({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('v', 'jf', "<cmd> lua require'hop'.hint_patterns({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
vim.api.nvim_set_keymap('o', 'jf', "<cmd> lua require'hop'.hint_patterns({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})
-- https://github.com/mfussenegger/nvim-treehopper
vim.api.nvim_set_keymap('n', 'jt', "<cmd> lua require'tsht'.nodes()<cr>", {})
vim.api.nvim_set_keymap('v', 'jt', "<cmd> lua require'tsht'.nodes()<cr>", {})
vim.api.nvim_set_keymap('o', 'jt', "<cmd> lua require'tsht'.nodes()<cr>", {})
-- https://github.com/AckslD/nvim-neoclip.lua
vim.api.nvim_set_keymap('n', 'gy', "<cmd> Telescope neoclip<cr>", {})
-- The visual_mode shortcut may conflict to use jk or jj to back to normal_mode.
vim.api.nvim_set_keymap('v', 'gy', "<cmd> Telescope neoclip<cr>", {})

-- https://github.com/ThePrimeagen/refactoring.nvim
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})
-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
-- zoom and rebalance the splites of nvim
vim.api.nvim_set_keymap("n", "gm", [[ <Cmd>wincmd |<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "gM", [[ <Cmd>wincmd =<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgo", [[ <Cmd>copen<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgc", [[ <Cmd>cclose<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgj", [[ <Cmd>cnext<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgk", [[ <Cmd>cprev<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgf", [[ <Cmd>cfirst<cr>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "lgl", [[ <Cmd>clast<cr>]], {noremap = true, silent = true, expr = false})

vim.api.nvim_set_keymap('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

vim.api.nvim_set_keymap('x', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('x', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('x', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
vim.api.nvim_set_keymap('x', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

vim.cmd [[ 
" https://github.com/preservim/vimux/issues/136
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap ru "vy :call VimuxSlime()<CR>
" https://github.com/preservim/vimux/blob/master/doc/vimux.txt
 " Open tmux pane runner
 map ro :VimuxOpenRunner<CR>
 " Prompt python command to run
 map rp :VimuxRunCommand("python") <CR>
 " Prompt for a command to run
 map rr :VimuxPromptCommand<CR>
 " Run last command executed by VimuxRunCommand
 map rl :VimuxRunLastCommand<CR>
 " Inspect runner pane
 map ri :VimuxInspectRunner<CR>
 " Close vim tmux runner opened by VimRunCommand
 map rq :VimuxCloseRunner<CR>
 " Interrupt any command running in the runner pane
 map rx :VimuxInterruptRunner<CR>
 " Zoom the runner pane (use <bind-key> z to restore runner pane)
 map rm :call VimuxZoomRunner()<CR>
 " Clear the terminal screen of the runner pane.
 map rc :VimuxClearTerminalScreen<CR>
]]

vim.cmd [[
" https://github.com/machakann/vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
]]

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
