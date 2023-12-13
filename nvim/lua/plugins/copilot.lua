return {
  "github/copilot.vim",
  config = function()
    -- Disable copilot by default
    vim.g.copilot_enabled = 0
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    local copilot_on = false
    vim.api.nvim_create_user_command("CopilotToggle", function()
      if copilot_on then
        vim.cmd("Copilot disable")
        print("Copilot OFF")
      else
        vim.cmd("Copilot enable")
        print("Copilot ON")
      end
      copilot_on = not copilot_on
    end, { nargs = 0 })
    vim.keymap.set("", "ce", ":CopilotToggle<CR>", { noremap = true, silent = true })
  end,
}
