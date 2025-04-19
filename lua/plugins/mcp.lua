return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup {
        extensions = {
          avante = {
            make_slash_commands = true,
          },
        },
      }
    end,
  },
}
