-- local M = {}
--
-- function M.setup(_)
--   require("dap-python").setup("python", {})
-- end
--
-- return M
-- python3 -m pip install debugpy 

return {
    adapters = {
        type = "executable",
        -- command = "/home/anaconda3/envs/dap/bin/python",
        command = "/home/anaconda3/envs/aacd/bin/python",
        -- command = "/home/anaconda3/envs/dap/bin/python",
        -- args = {"-m", "debugpy.adapter"},
        -- args = {}, at least need the config.
        args = {"--input_onnx" , "../tests/test_models/simp_dbnet_rn18_ops13_fp32.onnx", "--batch_size" , "1", "--data_type" , "fp16", "--chip_config" , "../configs/dorado.yaml", "-m", "debugpy.adapter"},
       },

    configurations = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
-- 指定 Python 解释器路径 in keymaps.lua
-- vim.g.python3_host_prog = '/scratch/workspace/guanghua/anaconda3/envs/learning_tvm/bin/python'
            pythonPath = function()
                -- return vim.g.python3_host_prog
                return "/home/anaconda3/envs/aacd/bin/python"
            end
        }
    }
}
