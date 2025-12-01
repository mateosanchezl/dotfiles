local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports" },
    javascript = { "prettierd", "prettier", "eslint_d" },
    typescript = { "prettierd", "prettier", "eslint_d" },
    vue = { "prettierd", "prettier" },
    php = { "pint" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    python = { "black" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
