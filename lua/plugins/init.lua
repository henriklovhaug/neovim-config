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
		"leoluz/nvim-dap-go",
		ft = { "go" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			require("dap-go").setup()
		end,
	},

	{
		"dustinblackman/oatmeal.nvim",
		cmd = { "Oatmeal" },
		config = function()
			require("oatmeal").setup({
				backend = "ollama",
				model = "llama3:8b",
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

	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {},
	},

	{
		"HakonHarnes/img-clip.nvim",
		ft = { "markdown" },
	},

	-- {
	-- 	dir = "~/dev/Preview.nvim",
	-- 	cmd = { "Preview" },
	-- 	config = function()
	-- 		require("preview").setup()
	-- 	end,
	-- },

	{
		"henriklovhaug/Preview.nvim",
		cmd = { "Preview" },
		config = function()
			require("preview").setup()
		end,
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

	{
		"NeogitOrg/neogit",
		cmd = { "Neogit" },
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},

	{ import = "plugins.other" },
}
