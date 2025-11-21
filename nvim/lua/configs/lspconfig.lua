require("nvchad.configs.lspconfig").defaults()

-- List all LSPs you want to use
local servers = {
  "gopls",
  "intelephense",
  "ts_ls",
  "eslint",
  "vue_ls",
  "cssls",
  "tailwindcss",
  "emmet_ls",
  "html",
  "jsonls",
  "yamlls",
  "prismals",
  "graphql",
  "marksman",
  "vtsls"
}

vim.lsp.enable(servers)
