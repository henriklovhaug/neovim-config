---@type NvPluginSpec
local spec = {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		{
			"sindrets/diffview.nvim",
			config = true,
		},
	},
	opts = {
		current_line_blame = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "<leader>gn", function()
				if vim.wo.diff then
					vim.cmd.normal({ "<leader>gn", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Go to next git hunk" })

			map("n", "<leader>gp", function()
				if vim.wo.diff then
					vim.cmd.normal({ "<leader>gp", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Go to previous git hunk" })

			map("n", "<leader>gp", gitsigns.preview_hunk)
			map("n", "<leader>gi", gitsigns.preview_hunk_inline)

			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)

			map("n", "<leader>hd", gitsigns.diffthis)

			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end)

			map("n", "<leader>hQ", function()
				gitsigns.setqflist("all")
			end)
			map("n", "<leader>hq", gitsigns.setqflist)

			-- Toggles
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle inline git blame" })
			map("n", "<leader>tw", gitsigns.toggle_word_diff)

			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk)
		end,
	},
}

return spec
