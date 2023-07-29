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

M.rust = {
  n = {
    ["<leader>rha"] = {
      function ()
        require("rust-tools").hover_actions.hover_actions()
      end,
    }
  }
}

-- more keybinds!

return M
