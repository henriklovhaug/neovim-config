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
		order = { "mode", "file", "git", "%=", "req", "%=", "cwd", "cursor" },
		modules = {
			req = function()
				return recording()
			end,
		},
	},
}

return M
