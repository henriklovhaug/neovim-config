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
      function()
        require("crates").update_all_crates()
      end,
      "update all crates",
    },
  },
}

M.rust = {
  n = {
    ["<leader>rha"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "show hover actions",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
    },
  },
}

M.dap_python = {
  n = {
    ["<leader>dc"] = {
      "<cmd>lua require('dap-python').test_class()<CR>",
      "Test class",
    },
    ["<leader>dpr"] = {
      "<cmd>lua require('dap-python').test_method()<CR>",
      "Test method",
    },
    ["<leader>dn"] = {
      "<cmd>lua require('dap-python').test_nearest()<CR>",
      "Test nearest",
    },
  },
}

M.jdtls = {
  n = {
    ["<leader>tnm"] = {
      function()
        require("jdtls").test_nearest_method()
      end,
      "Test nearest method",
    },
  },
}

-- more keybinds!

return M
