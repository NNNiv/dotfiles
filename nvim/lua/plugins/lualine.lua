return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "monokai-palenight",
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
					"hostname",
				},
				lualine_z = {
					"progress",
				},
			},

			extensions = {
				"nvim-tree",
			},
		})
	end,
}
