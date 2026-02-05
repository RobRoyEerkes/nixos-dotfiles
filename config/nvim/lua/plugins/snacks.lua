return {
	{
		"folke/snacks.nvim",
		lazy = false,
		opts = {
			layout = {
				enable = true,
			},
			explorer = {
				enable = true,
				replace_netrw = true,
			},
			picker = {},
			image = {
				enable = true,
			},
			dashboard = {
				enable = true,
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
		},

		keys = {
			{
				"<leader>e",
				function()
					require("snacks").explorer.open({})
				end,
			},
		},
	},
}
