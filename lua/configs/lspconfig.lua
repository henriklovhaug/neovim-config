local config = require("nvchad.configs.lspconfig")

local on_attach = config.on_attach
local on_init = config.on_init
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local my_attach = function(client, bufnr)
	on_attach(client, bufnr)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
end

-- if you just want default config for the servers then put them in a table
local servers = {
	"lua_ls",
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"svelte",
	"dockerls",
	"docker_compose_language_service",
	"tailwindcss",
	"texlab",
	"pyright",
	"prismals",
	"marksman",
	"htmx",
	"harper_ls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = my_attach,
		capabilities = capabilities,
	})
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

lspconfig.harper_ls.setup({
	settings = {
		["harper-ls"] = {
			diagnosticSeverity = "hint", -- Can also be "information", "warning", or "error"
			linters = {
				sentence_capitalization = false,
			},
		},
	},
})
