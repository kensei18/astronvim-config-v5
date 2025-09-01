---@type LazySpec
return {
  {
    "leoluz/nvim-dap-go",
    event = "User AstroFile",
    opts = {
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = 2345,
        args = {},
        build_flags = "",
      },
      dap_configurations = {
        {
          type = "go",
          name = "Remote Attach",
          request = "attach",
          mode = "remote",
          port = 2345,
          host = "0.0.0.0",
          substitutepath = {
            {
              from = "${workspaceFolder}",
              to = "${env:REMOTE_DEBUG_PATH}",
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "User AstroFile",
    config = function()
      local path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}
