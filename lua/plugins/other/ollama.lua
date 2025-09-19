local ai = {

	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		opts = {
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
					model = "qwen2.5-coder:14b",
				},
				cmd = {
					adapter = "ollama",
					model = "qwen2.5-coder:14b",
				},
			},
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							env = {
								url = "http://192.168.3.7:11434",
								api_key = "OLLAMA_API_KEY",
							},
							headers = {
								["Content-Type"] = "application/json",
							},
							parameters = {
								sync = true,
							},
						})
					end,
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"OXY2DEV/markview.nvim",
		event = "VeryLazy",
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
}

return ai

--
--
--
--V
-- return {
-- 	"nomnivore/ollama.nvim",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 	},
--
-- 	-- All the user commands added by the plugin
-- 	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
--
-- 	keys = {
-- 		-- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
-- 		{
-- 			"<leader>oo",
-- 			":<c-u>lua require('ollama').prompt()<cr>",
-- 			desc = "ollama prompt",
-- 			mode = { "n", "v" },
-- 		},
--
-- 		-- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
-- 		{
-- 			"<leader>oG",
-- 			":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
-- 			desc = "ollama Generate Code",
-- 			mode = { "n", "v" },
-- 		},
-- 	},
--
-- 	---@type Ollama.Config
-- 	opts = {
-- 		-- your configuration overrides
-- 		model = "gpt-oss:20b",
-- 		url = "http://192.168.3.7:11434",
-- 		-- View the actual default prompts in ./lua/ollama/prompts.lua
-- 		prompts = {
-- 			Sample_Prompt = {
-- 				prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
-- 				input_label = "> ",
-- 				model = "gpt-oss:20b",
-- 				action = "display",
-- 			},
-- 		},
-- 	},
-- }
