local M = {}

function M.setup(_)
  require("dap-python").setup("python", {})
  table.insert(require("dap").configurations.python, {
    type = "python",
    request = "attach",
    connect = {
      port = 5678,
      host = "127.0.0.1",
    },
    mode = "remote",
    name = "Container Attach Debug",
    cwd = vim.fn.getcwd(),
    pathMappings = {
      {
        localRoot = function()
          -- return vim.fn.input("Local code folder > ", vim.fn.getcwd(), "file")
          -- return vim.fn.getcwd()
          return "/home/bill/workspace/quant_project"

          --"/home/alpha2phi/workspace/alpha2phi/python-apps/ml-yolo/backend", -- Local folder the code lives
        end,
        remoteRoot = function()
          -- return vim.fn.input("Container code folder > ", "/home/app", "file")
          return "/workspace/quant_project" -- Container code folder the code lives, and shoul be right.
          
          -- "/fastapi", -- Wherever your Python code lives in the container.
        end,
      },
    },
  })
end

return M
