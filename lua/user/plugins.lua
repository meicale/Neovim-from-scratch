local fn = vim.fn
-- test
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
	use("folke/tokyonight.nvim")
	use("sainnhe/gruvbox-material")
  use 'shaunsingh/moonlight.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
	use({ "nvim-telescope/telescope-hop.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use("ThePrimeagen/git-worktree.nvim")
	use("tpope/vim-fugitive")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- nvim motion
	--  use "blackCauldron7/surround.nvim" -- need config
	-- use("tpope/vim-surround")
  use "machakann/vim-sandwich"
	use("unblevable/quick-scope")
	use({
		"phaazon/hop.nvim",
		branch = "master", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
  -- Tmux navigation
  use { 'alexghergh/nvim-tmux-navigation', config = function()
        require'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left       = "<M-h>",
                down       = "<M-j>",
                up         = "<M-k>",
                right      = "<M-l>",
                last_active= "<M-Space>",
                next       = "<M-\\>",
            }
        }
    end
  }

	use("ThePrimeagen/harpoon")
  -- use 'cjrh/vim-conda'
	-- asyncrun
	use("skywind3000/asyncrun.vim")
	use("skywind3000/asynctasks.vim")

	-- Test in neovim
	use("preservim/vimux")
	use("roxma/nvim-yarp")
	use("roxma/vim-hug-neovim-rpc")
	use("vim-test/vim-test")
	use({
		"rcarriga/vim-ultest",
		config = "require('user.dap.ultest').post()",
		requires = { "vim-test/vim-test" },
		run = ":UpdateRemotePlugins",
	})
	-- Debugging

	use({
		"mfussenegger/nvim-dap",
		-- opt = true,
		event = "BufReadPre",
		module = { "dap" },
		-- wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
		requires = {
			"Pocco81/DAPInstall.nvim",
			-- "theHamsta/nvim-dap-virtual-text",
			-- "rcarriga/nvim-dap-ui",
			-- "mfussenegger/nvim-dap-python",
			"nvim-telescope/telescope-dap.nvim",
			-- { "leoluz/nvim-dap-go", module = "dap-go" },
			{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
		},
		config = function()
			require("dap").setup()
      -- require('dap.ext.vscode').load_launchjs('.vscode/launch.json', { cppdbg = {'c', 'cpp'} , python = 'py'})
		end,
	})

	-- 为代码调试提供内联文本
	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("user.dap.nvim-dap-virtual-text")
		end,
	})

	-- 为代码调试提供 UI 界面
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("user.dap.nvim-dap-ui")
		end,
	})

	use("ojroques/vim-oscyank")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
