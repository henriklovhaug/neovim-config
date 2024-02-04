---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  statusline = {
    overriden_modules = function(modules)
      table.remove(modules, 5)
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
