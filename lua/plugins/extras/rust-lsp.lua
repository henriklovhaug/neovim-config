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

local my_attach = function(client, bufnr)
	on_attach(client, bufnr)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
end

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
				on_attach = my_attach,
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
