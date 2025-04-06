---@type LazySpec
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          hide_keyword = true,
        },
        definition = {
          width = 0.8,
        },
        finder = {
          max_height = 0.6,
          left_width = 0.2,
        },
        lightbulb = {
          enabled = false,
          sign = false,
          virtual_text = false,
          enable_in_insert = false,
        },
      }
    end,
  },
}
