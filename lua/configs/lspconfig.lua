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
	vim.lsp.inlay_hint.enable(true)
end

-- if you just want default config for the servers then put them in a table
local servers = {
	"clangd",
	"cssls",
	"dockerls",
	"docker_compose_language_service",
	"gopls",
	"harper_ls",
	"html",
	"htmx",
	"lua_ls",
	"marksman",
	"tailwindcss",
	"texlab",
	"tsserver",
	"pyright",
	"prismals",
	"svelte",
	"markdown_oxide",
}

local html_filetypes = { "html", "htmldjango", "templ" }

local luasnip = require("luasnip")
luasnip.filetype_extend("htmldjango", { "html" })

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

lspconfig.html.setup({
	filetypes = html_filetypes,
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig.htmx.setup({
	filetypes = html_filetypes,
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
})

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

lspconfig.gopls.setup({
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
	cmd = { "gopls" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git", "go.work"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
