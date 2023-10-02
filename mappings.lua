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
      "Open ui widgets",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "Open repl",
    },
  },
}

M.dap_ui = {
  n = {
    ["<leader>do"] = {
      function()
        require("dapui").open()
      end,
      "Open ui",
    },
    ["<leader>dc"] = {
      function()
        require("dapui").close()
      end,
      "Close ui",
    },
  },
}

M.dap_python = {
  n = {
    ["<leader>dpc"] = {
      "<cmd>lua require('dap-python').test_class()<CR>",
      "Test class",
    },
    ["<leader>dpr"] = {
      "<cmd>lua require('dap-python').test_method()<CR>",
      "Test method",
    },
    ["<leader>dpn"] = {
      "<cmd>lua require('dap-python').test_nearest()<CR>",
      "Test nearest",
    },
  },
}

M.jdtls = {
  n = {
    ["<leader>djn"] = {
      function()
        require("jdtls").test_nearest_method()
      end,
      "Test nearest method",
    },

    ["<leader>djc"] = {
      function()
        require("jdtls").test_class()
      end,
      "Test class",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "Find references",
    },
  },
}

M.nvim = {
  n = {
    ["<leader>qc"] = {
      "<cmd>cclose<CR>",
      "Close quickfix",
    },
  },
}

M.db = {
  n = {
    ["<leader>tu"] = {
      "<cmd>DBUIToggle<CR>",
      "Toggle db ui",
    },
  },
}

-- more keybinds!

return M
