local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command

require "custom.configs.set"

autocmd("FileType", {
  pattern = "markdown",
  command = "set spell",
})

cmd("Update", function()
  require "nvchad.updater"()
end, {})
