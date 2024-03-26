local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "ruff_format" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd" } },
		markdown = { "deno_fmt" },
		html = { { "prettierd" } },
		css = { { "prettierd" } },
		svelte = { { "prettierd" } },
		scss = { { "prettierd" } },
		yaml = { { "prettierd" } },
		toml = { { "prettierd" } },
		json = { { "prettierd" } },

		latex = { "latexindent" },

		rust = { "rustfmt" },

		java = { "google-java-format" },

		go = { "goimports" },

		sh = { "beautysh" },

		c = { "clang-format" },
		cpp = { "clang-format" },
		objc = { "clang-format" },
		cuda = { "clang-format" },

		xml = { "xmlformat" },

		sql = { "sqlfmt" },
	},
}

require("conform").setup(options)
