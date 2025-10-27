local ai = {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		opts = {
			strategies = {
				chat = {
					adapter = "ollama",
					model = "gpt-oss:20b",
				},
				inline = {
					adapter = "ollama",
					model = "codellama:13b",
				},
				cmd = {
					adapter = "ollama",
					model = "codellama:13b",
				},
			},
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							env = {
								url = "http://192.168.3.7:11434",
							},
							schema = {
								model = {
									default = "gpt-oss:20b",
									codellama = "codellama:13b",
								},
							},
							headers = {
								["Content-Type"] = "application/json",
							},
							parameters = {
								sync = true,
							},
						})
					end,
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"OXY2DEV/markview.nvim",
		},
	},
	{
		"OXY2DEV/markview.nvim",
		event = "VeryLazy",
		opts = {
			preview = {
				filetypes = { "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
}

return ai
