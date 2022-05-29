local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end
require('neoclip').setup({
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-i>",
				paste_behind = "<c-a>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d ",
				custom = {},
			},
		},

		fzf = {
			select = "default",
			paste = "ctrl-p",
			paste_behind = "ctrl-k",
			custom = {},
		},
	},
})
