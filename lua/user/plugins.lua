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
  use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }
  use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
  use { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }
  use { "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" }
  use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
  use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
  use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" }
  use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }
  use "folke/which-key.nvim"
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use("sainnhe/gruvbox-material")
  use 'shaunsingh/moonlight.nvim'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
  use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  -- use { "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters
  -- https://github.com/meicale/null-ls.nvim
  -- modify the repo to make it work on test machine. the black command has differrent args.
  use { "meicale/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }
  use({ "nvim-telescope/telescope-hop.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'tami5/sqlite.lua', module = 'sqlite' },
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
  }

  -- something like telescope
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

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "518e27589c0463af15463c9d675c65e464efc2fe",
    run = ":TSUpdate",
  }
  -- better find the object using "."
  use { 'RRethy/nvim-treesitter-textsubjects' }
  -- highlight the textobject like hop.
  use {
    "mfussenegger/nvim-ts-hint-textobject",
    config = function()
      -- require("tsht").setup { }
      -- require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
    end,
  }
  use("p00f/nvim-ts-rainbow")
  -- Location information using by status line
  use({
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }
  -- use("tpope/vim-surround")
  use "machakann/vim-sandwich"

  -- Git helper
  use("ThePrimeagen/git-worktree.nvim")
  use("tpope/vim-fugitive")
  use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
  use { "ruanyl/vim-gh-line" }

  -- MOTION
  -- In nvim buffer in sight
  use("unblevable/quick-scope")
  use({
    "phaazon/hop.nvim",
    branch = "master", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  })
  -- Between buffer/file and terminal
  use("ThePrimeagen/harpoon")
  -- Between Neovim and Tmux navigation
  use { 'alexghergh/nvim-tmux-navigation',
    config = function()
      require 'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left        = "<M-h>",
          down        = "<M-j>",
          up          = "<M-k>",
          right       = "<M-l>",
          last_active = "<M-,>",
          next        = "<M-.>",
        }
      }
    end
  }

  -- asyncrun
  use("skywind3000/asyncrun.vim")
  use("skywind3000/asynctasks.vim")

  -- Test in neovim
  use("preservim/vimux")
  use("roxma/nvim-yarp")
  use("roxma/vim-hug-neovim-rpc")
  use("vim-test/vim-test")
  -- TODO: Need updated. https://github.com/nvim-neotest/neotest
  use({
    "rcarriga/vim-ultest",
    config = "require('user.dap.ultest').post()",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
  })

  -- Debugging
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
  use({
    "mfussenegger/nvim-dap",
    -- opt = true,
    commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d",
    event = "BufReadPre",
    module = { "dap" },
    -- wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      -- "Pocco81/DAPInstall.nvim",
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
  -- debug inline text
  use({
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("user.dap.nvim-dap-virtual-text")
    end,
  })
  -- debug UI
  use({
    "rcarriga/nvim-dap-ui",
    commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("user.dap.nvim-dap-ui")
    end,
  })

  -- refactoring -- Under test, not quite useful
  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use("ojroques/vim-oscyank")

  -- -- tags and symbles viewer.
  -- use("liuchengxu/vista.vim")
  -- use("simnalamburt/vim-mundo")

  -- -- Multi-operations
  -- -- better matched information
  -- use({ "kevinhwang91/nvim-hlslens" })
  -- -- better * motions
  -- use("haya14busa/vim-asterisk")
  -- -- visual-multi
  -- -- use({ "mg979/vim-visual-multi", branch = "master" })

  -- -- Orgmode in nvim
  -- use({
  -- 	"nvim-orgmode/orgmode",
  -- 	config = function()
  -- 		-- require('orgmode').setup_ts_grammer()
  -- 		-- require('orgmode').setup{}
  -- 	end,
  -- })

  -- --adventurous wildmenu
  -- use({
  -- 	"gelguy/wilder.nvim",
  -- 	config = function()
  -- 		-- config goes here
  -- 	end,
  -- })

  -- -- remote development
  -- use("jamestthompson3/nvim-remote-containers")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
