---@type LazySpec
return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("oil").setup {
        view_options = {
          show_hidden = true,
        },
      }
    end,
  },
}
