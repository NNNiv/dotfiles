return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "javascript" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "html" },
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
