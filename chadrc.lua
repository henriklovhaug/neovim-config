---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files

local highlights = require "custom.highlights"

local recording = function()
  local register = vim.fn.reg_recording()
  if register == "" then
    return ""
  else
    return "%#St_LspProgress#" .. "Recording @" .. register
  end
end

M.ui = {
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  statusline = {
    overriden_modules = function(modules)
      table.remove(modules, 5)
      table.insert(modules, 5, recording())
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
