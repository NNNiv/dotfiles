return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- html = { "prettier" },
        python = { "black" },
        go = { "gofmt", "goimports" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        rust = { "rustfmt" },
      },
    })
  end,
}
