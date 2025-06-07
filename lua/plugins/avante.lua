---@type LazySpec
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  config = function()
    require("avante").setup {
      provider = "claude",
      auto_suggestions_provider = "claude",

      providers = {
        claude = {
          -- for MCP
          disable_tools = {
            "list_files",
            "search_files",
            "read_file",
            "create_file",
            "rename_file",
            "delete_file",
            "create_dir",
            "rename_dir",
            "delete_dir",
            "bash",
          },
        },
      },

      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_claude_text_editor_tool_mode = true,
        -- enable_cursor_planning_mode = true,
      },

      mappings = {
        suggestion = {
          accept = "<C-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-h>",
        },
      },

      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        if not hub then return nil end
        return hub:get_active_servers_prompt()
      end,

      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    }
  end,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
