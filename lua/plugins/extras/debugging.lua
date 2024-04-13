local map = vim.keymap.set

local spec = {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
	cmd = { "DebugContinue" },
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

		map({ "n" }, "<leader>dc", function()
			dap.continue()
		end, { desc = "Continue" })

		map({ "n" }, "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
	end,
}

local dap = require("dap")
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = "/Users/henrik/.local/share/nvim/mason/packages/codelldb/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.rust = {
	{
		type = "codelldb",
		name = "Debug",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = false,
	},
}

return spec
