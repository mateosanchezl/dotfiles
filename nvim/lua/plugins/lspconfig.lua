return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local severity = vim.diagnostic.severity
    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }

    -- Diagnostic configuration
    vim.diagnostic.config {
      virtual_text = { prefix = "●" },
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

    -- LSP capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    -- On init - disable semantic tokens
    local on_init = function(client, _)
      if client.supports_method and client:supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      elseif client.server_capabilities.semanticTokensProvider then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    -- LSP keymaps on attach
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
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts "List workspace folders")
        map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map("n", "<leader>ra", vim.lsp.buf.rename, opts "Rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        map("n", "gr", vim.lsp.buf.references, opts "Go to references")
        map("n", "gl", function()
          vim.diagnostic.open_float(nil, { focus = true, scope = "line", border = "rounded" })
        end, opts "Line diagnostics")
      end,
    })

    -- Configure global defaults using vim.lsp.config (Neovim 0.11+)
    vim.lsp.config("*", {
      capabilities = capabilities,
      on_init = on_init,
    })

    -- Lua LS specific settings
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            library = {
              vim.fn.expand "$VIMRUNTIME/lua",
              vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
              "${3rd}/luv/library",
            },
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- List of LSP servers to enable
    local servers = {
      "lua_ls",
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
      "rust_analyzer",
      "rust-analyzer",
      "html-lsp",
    }

    -- Enable all servers
    vim.lsp.enable(servers)
  end,
}
