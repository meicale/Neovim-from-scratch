local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

function _PYTHON_TEST()
  vim.cmd([[
    compiler pytest
    AsyncTask file-test
  ]])
end

function _MODEL_PERF()
  vim.cmd([[
    compiler python
    AsyncTask model-perf 
  ]])
end

function _PYTHON_DEV()
  vim.cmd([[
    compiler python
    AsyncTask file-dev
  ]])
end

function _PYTHON_GO()
  vim.cmd([[
    compiler python
    AsyncTask file-go
  ]])
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["B"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },

  b = {
		name = "Trouble",
		b = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
	},

	d = {
		name = "Debug",
		R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		E = {
			"<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
			"Evaluate Input",
		},
		C = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
			"Conditional Breakpoint",
		},
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		D = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		d = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		m = { "<cmd>lua require'telescope'.extensions.dap.commands{}<cr>", "Commands" },
		n = {
			"<cmd>require'telescope'.extensions.dap.configurations{}<cr>",
			"Configurations",
		},
		l = {
			"<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<cr>",
			"List breakpoints",
		},
		v = { "<cmd>lua require'telescope'.extensions.dap.variables{}<cr>", "Variables" },
		f = { "<cmd>lua require'telescope'.extensions.dap.frames{}<cr>", "Frames" },
	},

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { ":nohlsearch<CR>", "No Highlight" },
  ["H"] = { ":HlSearchLensToggle<CR>", "Toggle nvim-hlslens" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

	g = {
		name = "Git",
    z = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		a = {
			"<cmd>lua require 'telescope'.extensions.git_worktree.create_git_worktree()<CR>",
			"Add worktree",
		},
		f = { "<cmd>Git<CR>", "fugitive" },
		d = { "<cmd>Git diff<CR>", "diff" },
		["3"] = { "<cmd>Gvdiffsplit！<CR>", "conflicts 3-way" },
		t = { "<cmd>Git commit<CR>", "commit" },
		e = { "<cmd>Git rebase -i<CR>", "rebase -i" },
		h = { "<cmd>diffget //3<CR>", "keep_right" },
		g = { "<cmd>diffget //2<CR>", "keep_left" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		m = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
		w = {
			"<cmd>lua require 'telescope'.extensions.git_worktree.git_worktrees()<CR>",
			"Del/Switch worktrees",
		},
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		--    d = {
		--      "<cmd>Gitsigns diffthis HEAD<cr>",
		--      "Diff",
		--    },
	},

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics<cr>",
      "Diagnostics",
    },
    -- w = {
    --   "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    --   "Workspace Diagnostics",
    -- },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Loclist" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

	r = {
		name = "Compile&Run",
		-- Need .tasks file configed in the project directory.
		f = { "<cmd>AsyncTask file-run<cr>", "Run File" },
		b = { "<cmd>AsyncTask file-build<cr>", "Build File" },
		-- Need Makefile configed too in the project directory.
		a = { "<cmd>AsyncTask project-build<cr>", "Build Projects" },
		t = { "<cmd>AsyncTask project-run<cr>", "Run Projects" },

		-- python tracing back quickfixlist configurations
		-- c = { "<cmd>makeprg=python %<cr>", "Makeprg config" },
		r = { "<cmd>lua _PYTHON_DEV()<cr>", "Python run" },
		h = { "<cmd>lua _MODEL_PERF()<cr>", "Model perf " },
		j = { "<cmd>lua _PYTHON_GO()<cr>", "Temp python" },
		p = { "<cmd>compiler python<cr>", "Python compiler" },
		c = { "<cmd>compiler pytest<cr>", "Pytest compiler" },
		m = { "<cmd>make<cr>", "Make Run" },
	},

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix to Telescope" },
		l = { "<cmd>Telescope loclist<cr>", "loclist to Telescope" },
  },

	t = {
		name = "Test",
		a = { "<cmd>Ultest<cr>", "TestAll" },
		s = { "<cmd>UltestSummary!<cr>", "ToggleSummary" },
		c = { "<cmd>UltestClear<cr>", "ClearTest" },
		n = { "<cmd>UltestNearest<cr>", "TestNearest" },
		l = { "<cmd>UltestLast<cr>", "TestLast" },
		d = { "<cmd>UltestDebug<cr>", "DebugFile" },
		f = { "<cmd>UltestDebugNearest<cr>", "DebugNearest" },
		-- t = { "<cmd>UltestAttach<cr>", "Attach" },
		-- j = { "<cmd>lua require 'ultest'.ultest-next-fail<cr>", "NextFail" },
		-- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		u = { "<cmd>MundoToggle<cr>", "Views" },
		v = { "<cmd>Vista!!<cr>", "Views" },
    t = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    i = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	},

  T = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

	j = {
		name = "harpoon&hop&zoxide",
		w = { "<cmd>lua require 'hop'.hint_words()<cr>", "Hop Word" },
		r = { "<cmd>lua require 'hop'.hint_lines()<cr>", "Hop Row" },
		f = { "<cmd>lua require 'hop'.hint_patterns()<cr>", "Hop Patterns" },
		q = { "<cmd>QuickScopeToggle<CR>", "Toggle QuickScope" },

		h = { "<cmd>lua require 'harpoon.mark'.add_file()<cr>", "Harpoon Highlight" },
		l = { "<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<cr>", "Harpoon List" },
		j = { "<cmd>lua require 'harpoon.ui'.nav_next()<cr>", "Next File" },
		k = { "<cmd>lua require 'harpoon.ui'.nav_prev()<cr>", "Prev File" },
		g = { "<cmd>lua require 'harpoon.ui'.nav_file(1)<cr>", "First File" },
		a = { "<cmd>lua require 'harpoon.ui'.nav_file(2)<cr>", "2nd File" },
		s = { "<cmd>lua require 'harpoon.ui'.nav_file(3)<cr>", "3rd File" },
		d = { "<cmd>lua require 'harpoon.ui'.nav_file(4)<cr>", "4th File" },
		["5"] = { "<cmd>lua require 'harpoon.ui'.nav_file(5)<cr>", "5th File" },
		["6"] = { "<cmd>lua require 'harpoon.ui'.nav_file(6)<cr>", "6th File" },
		["7"] = { "<cmd>lua require 'harpoon.ui'.nav_file(7)<cr>", "7th File" },
		["8"] = { "<cmd>lua require 'harpoon.ui'.nav_file(8)<cr>", "8th File" },
		["9"] = { "<cmd>lua require 'harpoon.ui'.nav_file(9)<cr>", "9th File" },
		-- this just create a new tmux Terminal.
		v = { "<cmd>Telescope harpoon marks<cr>", "View marks" },
		t = { "<cmd>lua require 'harpoon.tmux'.gotoTerminal(1)<cr>", "Terminal" },
		z = { "<cmd>Telescope zoxide list<cr>", "View directories" },
		-- this doesn't work when using a down pane of the same window.
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
