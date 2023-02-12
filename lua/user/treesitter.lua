local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("nvim-treesitter.configs is NOT OK")
	return
end

-- -- https://github.com/nvim-treesitter/nvim-treesitter
-- this doesn't work because some repo does not exist on gitee.
-- for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
--   config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://meicale:wgh19861201@gitee.com/")
-- end

configs.setup({
  ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})

local status_ok_install, install = pcall(require, "nvim-treesitter.install")
if not status_ok_install then
  print("nvim-treesitter.install is NOT OK")
	return
end

-- This doesn't work
-- require("nvim-treesitter.install").command_extra_args = {
--     curl = { "--proxy", "http://127.0.0.1:10809" },
-- }

install.prefer_git = true

