---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts) opts.filesystem.hijack_netrw_behavior = "disabled" end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function() require("oil").setup {} end,
  },
}
