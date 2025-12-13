return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "goimports" },
      javascript = { "prettierd", "prettier", "eslint_d" },
      typescript = { "prettierd", "prettier", "eslint_d" },
      vue = { "prettierd", "prettier" },
      php = { "php_cs_fixer" },
      css = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      python = { "black" },
      rust = { "rustfmt" },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
    },
  },
}
