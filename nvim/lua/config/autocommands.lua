local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Format on save
autocmd("BufWritePre", {
  pattern = "",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Disable auto comment new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = {
    "xml",
    "html",
    "xhtml",
    "css",
    "scss",
    "javascript",
    "typescript",
    "yaml",
    "lua",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

local templ_format = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local cmd = "templ fmt " .. vim.fn.shellescape(filename)

  vim.fn.jobstart(cmd, {
    on_exit = function()
      if vim.api.nvim_get_current_buf() == bufnr then
        vim.cmd("e!")
      end
    end,
  })
end

autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format })
