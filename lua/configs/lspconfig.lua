local config = require("nvchad.configs.lspconfig")

local on_attach = config.on_attach
local on_init = config.on_init
local capabilities = config.capabilities

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lspconfig = require("lspconfig")

local my_attach = function(client, bufnr)
	on_attach(client, bufnr)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
	vim.lsp.inlay_hint.enable(true)
end

local ltex_attach = function(client, bufnr)
	on_attach(client, bufnr)
	require("ltex_extra").setup()
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
	vim.lsp.inlay_hint.enable(true)
end

local svelte_attach = function(client)
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*.js", "*.ts" },
		callback = function(ctx)
			client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		end,
	})
end

-- if you just want default config for the servers then put them in a table
local servers = {
	"astro",
	"clangd",
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	"gopls",
	-- "harper_ls",
	"html",
	"htmx",
	"lua_ls",
	"markdown_oxide",
	"marksman",
	"prismals",
	"pyright",
	"svelte",
	"tailwindcss",
	"texlab",
	"ts_ls",
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

lspconfig.ltex_plus.setup({
	on_attach = ltex_attach,
	capabilities = capabilities,
	on_init = on_init,
	filetypes = { "tex", "text", "plaintex" },
	settings = {
		ltex = {
			language = "en-US",
			dictionary = {
				["en-US"] = { "NvimLsp" },
			},
			diagnosticSeverity = "information",
			-- set to false to disable all errors and warnings
			setenceCacheSize = 2000,
		},
	},
})

lspconfig.texlab.setup({
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
	settings = {
		texlab = {
			-- build = {
			-- 	onSave = true,
			-- 	args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
			-- 	forwardSearchAfter = false,
			-- 	executable = "latexmk",
			-- 	name = "latexmk",
			-- },
			latexindent = {
				modifyLineBreaks = true,
				["local"] = vim.fn.getcwd() .. "/formatting.yaml",
			},
		},
	},
})

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

lspconfig.ts_ls.setup({
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

lspconfig.svelte.setup({
	on_attach = svelte_attach,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig.harper_ls.setup({
	on_attach = my_attach,
	capabilities = capabilities,
	on_init = on_init,
	filetypes = { "markdown", "html", "plaintex" },
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
