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

		map("n", "<leader>dq", dapui.close, { desc = "Close the UI" })
		map("n", "<Leader>dr", dap.restart, { desc = "Restart the debugger" })
	end,
}

local dap = require("dap")
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = vim.fn.exepath("codelldb"),
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

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

return spec
