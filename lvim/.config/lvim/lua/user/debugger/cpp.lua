local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local dap = require("dap")

-- C/C++ debugger
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "Launch file with arguments",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    args = function()
      local args = vim.fn.input("Arguments: ")
      return vim.split(args, " ", true)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
