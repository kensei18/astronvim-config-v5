---@type LazySpec
return {
  {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
    opts = {
      port = 8003,
      host = "localhost",
    },
  },
}
