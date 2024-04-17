require("nvchad.mappings")
local dap = require("dap")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map({ "n", "v" }, "<leader>fm", "<cmd>Format<CR>", { desc = "File Format with conform" })

map({ "n", "v" }, "j", "gj", { desc = "Move down visual line" })
map({ "n", "v" }, "k", "gk", { desc = "Move up visual line" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map({ "n", "v" }, ",", ":", { desc = "Enter command mode" })
map("n", "G", "Gzz", { desc = "Go to end of file" })
map("n", "T", "Gzt", { desc = "Go to end of file" })

map({ "n", "v" }, "<leader>om", function()
	require("oatmeal").start()
end, { desc = "Oatmeal" })

map("n", "<leader>ft", function()
	require("telescope.builtin").tags({ only_sort_tags = true })
end, { desc = "Find Tags" })

map("n", "<leader>fr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Find references" })

map("n", "<leader>h", function()
	vim.lsp.buf.hover()
end, { desc = "Show hover" })

map("n", "<leader>qb", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all buffers" })

map("n", "<leader>rcu", function()
	require("crates").update_all_crates()
end, { desc = "Update all crates" })

map("n", "<leader>rcv", function()
	require("crates").show_versions_popup()
end, { desc = "Show create version" })

map("n", "<leader>rcf", function()
	require("crates").show_features_popup()
end, { desc = "Show crate feature" })

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "Continue/Start debugging" })

map("n", "<leader>djn", function()
	require("jdtls").test_nearest_method()
end, { desc = "Test nearest method" })

map("n", "<leader>djc", function()
	require("jdtls").test_class()
end, { desc = "Test class" })

map("n", "<C-w>o", function()
	require("zen-mode").toggle({
		window = {
			width = 0.85, -- width will be 85% of the editor width
		},
	})
end, { desc = "Zen mode" })

map("n", "ø", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "æ", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
