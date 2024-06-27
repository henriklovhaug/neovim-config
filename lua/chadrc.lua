local M = {}

local recording = function()
	local register = vim.fn.reg_recording()
	if register == "" then
		return ""
	else
		return "%#St_lspInfo#" .. "Recording @" .. register
	end
end

M.ui = {
	-- theme = "onedark",
	transparency = true,

	statusline = {
		order = { "mode", "file", "git", "%=", "req", "%=", "diagnostics", "lsp", "cwd", "cursor" },
		modules = {
			req = function()
				return recording()
			end,
		},
	},

	tabufline = {
		order = { "treeOffset", "buffers", "tabs" },
	},
}

M.lsp = { signature = false }

return M
