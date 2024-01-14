return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP settings (for overriding per client)
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = default_capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
          client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              {
                diagnostics = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end,
    })

    -- C / C++
    lspconfig.clangd.setup({
      handlers = handlers,
      cmd = {
        "clangd",
        "--offset-encodings=utf-16",
      },
    })

    -- Python
    lspconfig.pyright.setup({
      handlers = handlers,
      capabilities = default_capabilities,
    })

    -- Rust
    lspconfig.rust_analyzer.setup({
      handlers = handlers,
      capabilities = default_capabilities,
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ["rust-analyzer"] = {},
      },
    })

    -- Go
    lspconfig.gopls.setup({
      handlers = handlers,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    local make_client_capabilities = vim.lsp.protocol.make_client_capabilities()
    make_client_capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- TypeScript / JavaScript
    lspconfig.tsserver.setup({
      handlers = handlers,
      capabilities = default_capabilities,
    })

    -- CSS
    lspconfig.cssls.setup({
      handlers = handlers,
      capabilities = make_client_capabilities,
    })

    -- Emmet
    lspconfig.emmet_ls.setup({
      handlers = handlers,
    })

    -- Svelte
    lspconfig.svelte.setup({
      handlers = handlers,
    })

    -- Astro
    lspconfig.astro.setup({
      handlers = handlers,
    })

    -- Tailwind
    lspconfig.tailwindcss.setup({
      handlers = handlers,
    })

    -- Eslint
    lspconfig.eslint.setup({
      settings = {
        packageManager = "yarn",
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    -- Keybindings
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
