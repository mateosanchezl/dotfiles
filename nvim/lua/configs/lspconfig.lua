require("nvchad.configs.lspconfig").defaults()

-- List all LSPs you want to use
local servers = {
  "gopls",
  "intelephense",
  "ts_ls",
  "eslint",
  "cssls",
  "tailwindcss",
  "emmet_ls",
  "html",
  "jsonls",
  "yamlls",
  "prismals",
  "graphql",
  "marksman",
  "vtsls",
  "vue_language_server",
  "pyright",
}

vim.lsp.enable(servers)
