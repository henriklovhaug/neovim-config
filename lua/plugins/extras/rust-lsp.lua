local lspconfig = require("nvchad.configs.lspconfig")

local on_attach = lspconfig.on_attach
local capabilities = lspconfig.capabilities
local on_init = lspconfig.on_init

local spec = {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	ft = { "rust" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

local my_attach = function(client, bufnr)
	on_attach(client, bufnr)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
end

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = my_attach,
		capabilities = capabilities,
		on_init = on_init,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {},
		},
	},
	-- DAP configuration
	dap = {},
}

return spec
