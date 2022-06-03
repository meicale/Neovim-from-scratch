local status_ok, dap = pcall(require, "dap")
if not status_ok then
  print("nvim-dap is not ok!")
  return
end

-- print("seting up dap")
dap.setup = function ()
    vim.fn.sign_define("DapBreakpoint", {text = "$", texthl = "TodoFgFIX", linehl = "", numhl = ""})
    local adapters = {
        type = "executable",
        command = "/home/anaconda3/envs/aacd/bin/python",
        args = {"-m", "debugpy.adapter"},
        -- args = {"--input_onnx" , "../tests/test_models/simp_dbnet_rn18_ops13_fp32.onnx", "--batch_size" , "1", "--data_type" , "fp16", "--chip_config" , "../configs/dorado.yaml", "-m", "debugpy.adapter"},
       }

    local configurations = {
        {
            name = "Model perf",
            type = "python",
            request = "launch",
            program = "${workspaceFolder}/tools/test_model_perf.py",
            cwd =  "${workspaceFolder}/tools",
            args = {"--input_onnx", "../tests/test_models/simp_dbnet_rn18_ops13_fp32.onnx", "--batch_size", "1", "--data_type", "fp16", "--chip_config", "../configs/dorado.yaml"},
            pythonPath = function()
                -- return vim.g.python3_host_prog
                return "/home/anaconda3/envs/aacd/bin/python"
            end
        },
        {
            name = "This file",
            type = "python",
            request = "launch",
            program = "${file}",
            cwd =  "${fileDirname}",
            -- args = {"--input_onnx", "../tests/test_models/simp_dbnet_rn18_ops13_fp32.onnx", "--batch_size", "1", "--data_type", "fp16", "--chip_config", "../configs/dorado.yaml"},
            pythonPath = function()
                -- return vim.g.python3_host_prog
                -- return "/home/anaconda3/envs/aacd/bin/python"
                return "/home/anaconda3/envs/aacd/bin/python"
            end
        }
    }
    -- print(configurations)
    dap.adapters.python = adapters
    dap.configurations.python = configurations
    -- print("dap config done")

    -- local conf = require('dap.ext.vscode').load_launchjs('.vscode/launch.json')
end
