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
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"mfussenegger/nvim-dap",
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
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
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
		config = function()
			require("codesnap").setup({
				watermark = "",
			})
		end,
	},

	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {},
	},

	{ import = "plugins.extras" },
}
