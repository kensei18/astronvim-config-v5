---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      -- default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    cmdline = {
      completion = {
        ghost_text = { enabled = true },
      },
    },
  },
}
