local spec = {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		routes = {
			{
				filter = {
					find = "Linting...",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					kind = "",
				},
				opts = { skip = true },
			},
			{
				filter = {
					find = "server cancelled the request",
				},
				opts = { skip = true },
			},
			{
				filter = {
					find = "getaddrinfo ENOTFOUND api.github.com",
				},
				opts = { skip = true },
			},
		},
		presets = {
			lsp_doc_border = true,
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				silent = true,
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
