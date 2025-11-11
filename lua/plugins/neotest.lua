---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      {
        "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
        branch = "main", -- NOTE; not the master branch!
        build = function() vim.cmd ":TSUpdate go" end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*", -- Optional, but recommended; track releases
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
        end,
      },
      "nvim-neotest/neotest-jest",
      "thenbe/neotest-playwright",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

      require("neotest").setup {
        adapters = {
          require "neotest-golang" {
            runner = "gotestsum", -- Optional, but recommended
            go_test_args = { "-count=1", "-tags=integration,e2e" },
            go_list_args = { "-tags=integration,e2e" },
            dap_go_opts = {
              delve = {
                build_flags = { "-tags=integration,e2e" },
              },
            },
          },
          require "neotest-jest" {},
          require("neotest-playwright").adapter {
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          },
          require "neotest-vitest" {},
          require "neotest-python" {},
        },
        quickfix = {
          enabled = false,
          open = false,
        },
      }
    end,
  },
}
