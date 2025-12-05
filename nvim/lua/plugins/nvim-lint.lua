return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      vue = { "eslint_d" },
      go = { "golangcilint" },
      php = { "pint" },
      python = { "flake8" },
      rust = { "clippy" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
