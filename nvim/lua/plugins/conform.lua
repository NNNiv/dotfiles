return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier" },
        python = { "black" },
        javascript = { { "prettierd", "prettier" } },
      },
    })
  end,
}
