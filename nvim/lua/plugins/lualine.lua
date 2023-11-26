return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "monokai-palenight-minimal",
        section_separators = "",
        component_separators = "",
      },

      sections = {
        lualine_b = { "branch" },
        lualine_x = {
          {
            "diff",
            colored = true,
            diff_color = {
              added = "DiffAdd",
              modified = "DiffChange",
              removed = "DiffDelete",
            },
          },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "filesize",
          "filetype",
        },
      },

      extensions = {
        "nvim-tree",
      },
    })
  end,
}
