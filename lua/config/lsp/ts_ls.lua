local commonSettings = {
  preferences = {
    importModuleSpecifier = "non-relative",
  },
  inlayHints = false,
  format = {
    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  },
}

return {
  settings = {
    javascript = commonSettings,
    typescript = commonSettings,
  },
}
