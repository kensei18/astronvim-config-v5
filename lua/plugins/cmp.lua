---@type LazySpec
return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      completion = {
        menu = { auto_show = true },
      },
      keymap = {
        ["<CR>"] = { "select_accept_and_enter", "fallback" },
      },
    },
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
  },
}
