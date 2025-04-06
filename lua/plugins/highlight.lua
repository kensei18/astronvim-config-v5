---@type LazySpec
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = function()
      local highlight = {
        "RainbowBlue",
        "RainbowYellow",
        "RainbowRed",
        "RainbowGreen",
        "RainbowOrange",
        "RainbowCyan",
        "RainbowViolet",
      }
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = {
          enabled = true,
          highlight = highlight,
          show_start = false,
          show_end = false,
        },
      }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
    config = function()
      require("rainbow-delimiters.setup").setup {
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterRed",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
