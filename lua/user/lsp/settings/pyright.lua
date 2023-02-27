return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "on",
      },
    },
  },
}

-- This doesn't work yet! taking advantage of lsp server in remote docker container.
-- local status_ok, lspcontainers = pcall(require, "lspcontainers")
-- if not status_ok then
--   print("lspcontainers is NOT ok!")
--   return
-- end
-- return {
--   before_init = function(params)
--     params.processId = vim.NIL
--   end,
--   new_root_dir = '/app',
--   on_new_config = function(new_config, new_root_dir)
--     new_config.cmd = require'lspcontainers'.command('pyright', {root_dir = new_root_dir})
--   end,
--   cmd = require'lspcontainers'.command('pyright', {
--     workdir = '/home/bill/workspace',
--     image = 'devcontainer-app',
--     network = 'bridge',
--     cmd = function (runtime, image)
--       return {
--         runtime,
--         "run",
--         "--interactive",
--         "--rm",
--         image,
--     }
--     end
--   }),
--   jus = 'jus',
--   root_dir = require'lspconfig/util'.root_pattern(".git", vim.fn.getcwd()),
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "on",
--       },
--     },
--   },
-- }
