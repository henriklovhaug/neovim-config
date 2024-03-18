local spec = {
	-- nvim-notify
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	module = "notify",
	opts = {
		-- add any options here
		background_colour = "#000000",
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}

return spec
