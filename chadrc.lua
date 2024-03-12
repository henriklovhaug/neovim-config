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

local lazy_plugs = require "plugins.configs.lazy_nvim"
--
local disabled_plugins = lazy_plugs.performance.rtp.disabled_plugins

for k, v in pairs(disabled_plugins) do
  if v == "zip" or v == "zipPlugin" or v == "gzip" or v == "tar" or v == "tarPlugin" then
    disabled_plugins[k] = nil
  end
end

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = disabled_plugins,
    },
  },
}

return M
