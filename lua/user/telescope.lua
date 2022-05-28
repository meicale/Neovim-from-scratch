local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local trouble = require("trouble.providers.telescope")

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<M-t>"] = trouble.open_with_trouble,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        -- IMPORTANT for telescope hop plugin.
        -- either hot-reloaded or `function(prompt_bufnr) telescope.extensions.hop.hop end`
        -- ["<C-h>"] = R("telescope").extensions.hop.hop,  -- hop.hop_toggle_selection -- This doesn't work.
        -- custom hop loop to multi selects and sending selected entries to quickfix list
        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<M-t>"] = trouble.open_with_trouble,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
       fzf = {
           fuzzy = true,                    -- false will only do exact matching
           override_generic_sorter = true,  -- override the generic sorter
           override_file_sorter = true,     -- override the file sorter
           case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
       },
       git_worktree = {},
       harpoon = {},
       neoclip = {},
       hop = {
       -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
       keys = {"a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
              "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
              "A", "S", "D", "F", "G", "H", "J", "K", "L", ":",
              "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", },
       -- Highlight groups to link to signs and lines; the below configuration refers to demo
       -- sign_hl typically only defines foreground to possibly be combined with line_hl
       sign_hl = { "WarningMsg", "Title" },
       -- optional, typically a table of two highlight groups that are alternated between
       line_hl = { "CursorLine", "Normal" },
       -- options specific to `hop_loop`
       -- true temporarily disables Telescope selection highlighting
       clear_selection_hl = false,
       -- highlight hopped to entry with telescope selection highlight
       -- note: mutually exclusive with `clear_selection_hl`
       trace_entry = true,
       -- jump to entry where hoop loop was started from
       reset_selection = true,
       },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('git_worktree')
require('telescope').load_extension('hop')
require("telescope").load_extension('harpoon')
-- require('telescope').load_extension('neoclip')
-- require("telescope").load_extension("refactoring")
