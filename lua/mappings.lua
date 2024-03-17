require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("n", ",", ":", { desc = "Enter command mode" })
map("n", "G", "Gzz", { desc = "Go to end of file" })
map("n", "T", "Gzt", { desc = "Go to end of file" })

map("n", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "Code Actions" })

map("n", "<leader>om", function()
	require("oatmeal").start()
end, { desc = "Oatmeal" })
map("v", "<leader>om", function()
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
