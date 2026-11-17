local opencode_cmd = "opencode"

local snacks_terminal_opts = {
	win = {
		position = "right",
		enter = false,
	},
}

vim.g.opencode_opts = {
	server = {
		start = function()
			require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
		end,
	},
}

-- Can also leverage toggle functionality.
-- If you use <leader> here, remove 't' — otherwise Neovim will add input delay to your <leader> when typing in the terminal to watch for the mapping.
vim.keymap.set({ "n", "t" }, "<C-l>", function()
	require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
end, { desc = "Toggle OpenCode" })

-- Optionally show the terminal when OpenCode starts executing
vim.api.nvim_create_autocmd("User", {
	pattern = { "OpencodeEvent:session.execution.started" },
	callback = function()
		local win = require("snacks.terminal").get(opencode_cmd, { create = false })
		if win then
			win:show()
		end
	end,
})

return {
	"nickjvandyke/opencode.nvim",
	-- Defaults to "main", supporting OpenCode v2.
	-- Uncomment to pull the latest stable release, supporting OpenCode v1.
	-- version = "*",
	lazy = false,
	config = function()
		vim.g.opencode_opts = {
			-- Your configuration, if any; goto definition on the type for details
		}

		-- Recommended/example keymaps
		vim.keymap.set({ "n", "x" }, "<C-e>", function()
			require("opencode").ask("@this: ")
		end, { desc = "Ask OpenCode…" })
		-- vim.keymap.set({ "n", "x" }, "<C-x>",   function() require("opencode").select() end,                          { desc = "Select OpenCode…" })
		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this")
		end, { desc = "Send range to OpenCode", expr = true })
		vim.keymap.set({ "n" }, "goo", function()
			return require("opencode").operator("@this") .. "_"
		end, { desc = "Send line to OpenCode", expr = true })
	end,
}
