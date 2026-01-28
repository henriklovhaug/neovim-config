local M = {}

local recording = function()
	local register = vim.fn.reg_recording()
	if register == "" then
		return ""
	else
		return "%#St_lspInfo#" .. "Recording @" .. register
	end
end

M.base64 = {
	theme = "onedark",
	transparency = true,
}

M.ui = {
	statusline = {
		order = { "mode", "file", "git", "%=", "req", "%=", "diagnostics", "lsp", "cwd", "cursor" },
		modules = {
			req = function()
				return recording()
			end,
		},
	},

	tabufline = {
		order = { "treeOffset", "buffers", "tabs" },
	},
}

M.mason = {
	pkgs = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"astro-language-server",
		"css-lsp",
		"deno",
		"djlint",
		"html-lsp",
		"htmx-lsp",
		"prettier",
		"prettierd",
		"typescript-language-server",

		--tailwindcss
		"tailwindcss-language-server",

		--python stuff
		"debugpy",
		"isort",
		"pyright",
		"ruff",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- rust
		"codelldb",
		"rust-analyzer",

		-- svelte
		"svelte-language-server",

		-- Docker compose
		"docker-compose-language-service",
		"dockerfile-language-server",
		"hadolint",

		-- sql
		"prisma-language-server",
		"sqlfmt",
		"sqls",

		-- go
		"delve",
		"glint",
		"goimports",
		"goimports-reviser",
		"golangci-lint",
		"golangci-lint-langserver",
		"golines",
		"gopls",
		"gotests",
		"gotestsum",

		-- java
		"checkstyle",
		"google-java-format",
		"java-debug-adapter",
		"java-test",
		"jdtls",
		"vscode-java-decompiler",

		-- latex
		"latexindent",
		"texlab",
		"ltex-ls-plus",

		-- markdown
		"harper-ls",
		"ltex-ls",
		"marksman",
		"markdown-oxide",

		-- xml
		"xmlformatter",

		-- cli
		"ast-grep",
		"gitui",
		"trivy",

		-- shell
		"beautysh",

		-- Pest
		"pest-language-server",
	},
}

M.lsp = { signature = false }

return M
