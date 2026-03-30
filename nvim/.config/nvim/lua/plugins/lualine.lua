return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = {
					normal = {
						a = { bg = "#2c2c2c", fg = "#ffffff", gui = "bold" }, -- dark grey
						b = { bg = "#2c2c2c", fg = "#ffffff" },
						c = { bg = "#2c2c2c", fg = "#ffffff" },
					},
					inactive = {
						a = { bg = "#2c2c2c", fg = "#888888" },
						b = { bg = "#2c2c2c", fg = "#888888" },
						c = { bg = "#2c2c2c", fg = "#888888" },
					},
				},
				section_separators = "",
				component_separators = "",
				icons_enabled = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = { "filename", "branch" }, -- filename + git branch
				lualine_c = {},
				lualine_x = { "diagnostics" },
				lualine_y = { "%m" }, -- shows [+] if modified, [-] if readonly
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		},
	},
}

