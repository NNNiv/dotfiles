return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kdheepak/lazygit.nvim",
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("lazygit")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
      vim.keymap.set("n", "<leader>fcr", builtin.colorscheme, {})
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  },
}
