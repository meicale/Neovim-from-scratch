local status_ok, distant = pcall(require, "distant")
if not status_ok then
  print("distant is NOT ok!")
  return
end

local status_ok_2, actions = pcall(require, "distant.nav.actions")
if not status_ok_2 then
  print("distant.nav.actions is NOT ok!")
  return
end

distant.setup {
  -- Any settings defined here are applied to all hosts
  ['*'] = {
    distant = {
      args = {'--shutdown', 'lonely=60'},
    },
    file = {
      mappings = {
        ['-']         = actions.up,
      },
    },
    dir = {
      mappings = {
        ['<Return>']  = actions.edit,
        ['-']         = actions.up,
        ['K']         = actions.mkdir,
        ['N']         = actions.newfile,
        ['R']         = actions.rename,
        ['D']         = actions.remove,
      }
    },
  },

  -- Any settings defined here are applied only to example.com
  ['ssh://root@127.0.0.1:2222'] = {
    distant = {
      bin = '/usr/local/bin/distant',
    },
    lsp = {
      ['python'] = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { 'python' },
        root_dir = '/test',
		    on_attach = require("user.lsp.handlers").on_attach,
      },
    },
  },

  -- Any settings defined here are applied only to example.com
  ['ssh://bill@155.138.143.224'] = {
    distant = {
      bin = '/usr/local/bin/distant',
    },
    lsp = {
      ['python'] = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { 'python' },
        root_dir = '/home/bill',
		    on_attach = require("user.lsp.handlers").on_attach,
      },
    },
  },

}

-- print("distant.nvim setted up!")
