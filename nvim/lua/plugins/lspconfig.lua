return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end

        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
        map("n", "K", vim.lsp.buf.hover, opts "Hover documentation")
        map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        map("n", "<C-k>", vim.lsp.buf.signature_help, opts "Signature help")
        map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map("n", "<leader>ra", vim.lsp.buf.rename, opts "Rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        map("n", "gr", vim.lsp.buf.references, opts "Go to references")
        map("n", "gl", function()
          vim.diagnostic.open_float(nil, { focus = true, scope = "line", border = "rounded" })
        end, opts "Line diagnostics")
      end,
    })

    local servers = {
      "lua_ls",
      "gopls",
      "intelephense",
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
      "rust_analyzer",
    }

    vim.lsp.enable(servers)
  end,
}
