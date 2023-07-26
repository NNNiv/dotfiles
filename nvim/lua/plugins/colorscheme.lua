return {
  name = "monokai-palenight.nvim",
  lazy = false,
  dir = "~/monokai-palenight.nvim",
  dev = true,
  config = function()
    vim.cmd([[ colorscheme monokai-palenight ]])
  end
}

-- return {
--   "nnniv/monokai-palenight.nvim",
--
--   config = function()
--     vim.cmd([[ colorscheme monokai-palenight ]])
--   end
-- }
