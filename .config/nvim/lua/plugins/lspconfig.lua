return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local severity = vim.diagnostic.severity
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    vim.diagnostic.config {
      virtual_text = { prefix = " " },
      signs = {
        text = {
          [severity.ERROR] = signs.Error,
          [severity.WARN] = signs.Warn,
          [severity.HINT] = signs.Hint,
          [severity.INFO] = signs.Info,
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    }
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

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local vue_ls_path = vim.fn.stdpath "data"
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    vim.lsp.config("vtsls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_ls_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
      },
    })

    vim.lsp.config("vue_ls", {})

    -- Enabled servers
    vim.lsp.enable {
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
      "vue_ls",
      "pyright",
      "rust_analyzer",
    }
  end,
}
