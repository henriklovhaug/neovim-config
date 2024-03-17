local spec = {
	-- lazy.nvim
	"folke/noice.nvim",
	event = "cmdlineEnter",
	opts = {
		-- add any options here
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
				},
				opts = { skip = true },
			},
		},
		presets = {
			lsp_doc_border = true,
		},

		lsp = {
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}

return spec
