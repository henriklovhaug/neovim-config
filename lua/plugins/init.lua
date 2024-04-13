local overrides = require("overrides")

return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
			require("noice").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},

	{
		"saecki/crates.nvim",
		dependencies = "hrsh7th/nvim-cmp",
		ft = { "rust", "toml" },
		config = function()
			local crate = require("crates")
			crate.setup({
				popup = {
					autofocus = true,
				},
			})
			crate.show()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},


	{
		"dustinblackman/oatmeal.nvim",
		cmd = { "Oatmeal" },
		config = function()
			require("oatmeal").setup({
				backend = "ollama",
				model = "gemma:latest",
			})
		end,
	},

	{
		"pest-parser/pest.vim",
		ft = { "pest" },
		config = function()
			require("pest-vim").setup({})
		end,
	},

	{
		"ludovicchabant/vim-gutentags",
		lazy = false,
	},

	{
		"aznhe21/actions-preview.nvim",
	},

	{
		"mistricky/codesnap.nvim",
		build = "make",
		cmd = { "CodeSnap" },
		config = function()
			require("codesnap").setup({
				watermark = "",
			})
		end,
	},

	{ import = "plugins.extras" },
}
