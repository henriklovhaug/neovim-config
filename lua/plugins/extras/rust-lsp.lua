local lspconfig = require("nvchad.configs.lspconfig")

local on_attach = lspconfig.on_attach
local capabilities = lspconfig.capabilities

-- local spec = {
--   "mrcjkb/rustaceanvim",
--   version = "^4", -- Recommended
--   ft = { "rust" },
--   dependencies = {
--     "neovim/nvim-lspconfig",
--   },
-- }

local spec = {
	"simrat39/rust-tools.nvim",
	ft = { "rust" },
	config = function()
		require("rust-tools").setup({
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			server = {
				on_attach = on_attach,
				capabilities = capabilities,

				settings = {
					["rust-analyzer"] = {
						-- Other Settings ...
						procMacro = {
							ignored = {
								leptos_macro = {
									-- optional: --
									-- "component",
									"server",
								},
							},
						},
					},
				},
			},
		})
	end,
	dependencies = "neovim/nvim-lspconfig",
}
return spec
