---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "typescript-language-server",
        "biome",
        "gopls",
        -- "golangci_lint_ls",
        "pyright",
        "json-lsp",
        "yaml-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "graphql-language-service-cli",
        "terraform-ls",
        "bash-language-server",
        "sqls",

        -- None-ls
        "stylua",
        "cspell",
        "prettierd",
        "goimports",
        "tflint",

        -- DAP
        "go-debug-adapter",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local path_utils = require "utils.path"

      opts.handlers = {
        prettierd = function(source_name, methods)
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            condition = function(utils)
              return path_utils.has_files({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.yaml",
                ".prettierrc.yml",
                ".prettierrc.js",
                ".prettierrc.cjs",
                "prettier.config.js",
              }, vim.fn.getcwd())
            end,
          })
        end,
        biome = function(_, _)
          null_ls.register(null_ls.builtins.formatting.biome.with {
            condition = function(_)
              return path_utils.has_files({
                "biome.json",
                "biome.jsonc",
              }, vim.fn.getcwd())
            end,
          })
        end,
      }
    end,
  },
}
