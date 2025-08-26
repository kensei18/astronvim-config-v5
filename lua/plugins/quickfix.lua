---@type LazySpec
return {
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    ---@type BqfConfig
    opts = {},
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
}
