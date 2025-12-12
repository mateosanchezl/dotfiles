return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"
    local executable = vim.fn.executable

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      vue = { "eslint_d" },
      go = { "golangcilint" },
      php = { "phpcs" },
      python = { "flake8" },
      html = { "htmlhint" },
      -- rust = { "clippy" },
    }

    -- Only run linters that have a resolved executable to avoid ENOENT errors
    local function lint_available()
      local linters = lint.linters_by_ft[vim.bo.filetype]
      if not linters then
        return
      end

      local runnable = {}

      for _, linter in ipairs(linters) do
        local linter_def = lint.linters[linter]
        local cmd = linter_def and linter_def.cmd or linter

        if type(cmd) == "function" then
          cmd = cmd()
        end

        if not cmd or executable(cmd) == 1 then
          table.insert(runnable, linter)
        end
      end

      if #runnable > 0 then
        lint.try_lint(runnable)
      end
    end

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint_available()
      end,
    })
  end,
}
