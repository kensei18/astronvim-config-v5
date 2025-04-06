---@type LazySpec
return {
  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim",
    },
    event = "VeryLazy",
  },
  {
    "FabijanZulj/blame.nvim",
    event = "BufEnter",
    opts = {
      date_format = "%Y-%m-%d",
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "folke/snacks.nvim",
    },
    event = "User AstroGitFile",
    config = function()
      require("octo").setup {
        enable_builtin = true,
        suppress_missing_scope = {
          projects_v2 = true,
        },
        mappings = {
          review_thread = {
            delete_comment = { lhs = "<Leader><Leader>cd", desc = "delete comment" },
          },
          review_diff = {
            add_review_comment = { lhs = "<Leader><Leader>ca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<Leader><Leader>cs", desc = "add a new review suggestion" },
          },
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    cmd = { "DiffviewOpen" },
    opts = {
      default_args = {
        DiffviewOpen = { "--imply-local" },
      },
    },
  },
}
