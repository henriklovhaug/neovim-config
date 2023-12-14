local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
require "custom.configs.set"

autocmd("FileType", {
  pattern = "markdown",
  command = "set spell",
})
