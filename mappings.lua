---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").update_all_crates()
      end,
      "update all crates",
    }
  }
}

-- more keybinds!

return M
