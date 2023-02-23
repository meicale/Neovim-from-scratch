local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  print("neotest is not ok!:")
  return
end

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
