---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["G"] = { "Gzz", "Goto line. Defaults to last", opts = { nowait = true } },
    ["T"] = { "Gzt", "Move line to top", opts = { nowait = true } },
    ["<leader>d"] = { [["_d]], "Delete without yanking" },
    ["<leader>sv"] = { "<cmd> vsplit <CR>", "Split window" },
    ["<leader>sh"] = { "<cmd> split <CR>", "Split window" },
    ["<leader>h"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    -- Implement when the plugin works
    -- ["<leader>ca"] = {
    --   function()
    --     if vim.bo.filetype == "rust" then
    --       vim.cmd.RustLsp "codeAction"
    --     else
    --       vim.lsp.buf.code_action()
    --     end
    --   end,
    --   "LSP code action",
    -- },
    -- ["K"] = { "k", "Move up one full line" },
    ["<leader>qb"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close all buffers",
    },
    ["<leader>qa"] = { "<cmd> qa <CR>", "Quit NeoVim" },
  },
  v = {
    ["<leader>d"] = { [["_d]], "Delete without yanking" },
  },
}

M.rust = {
  n = {
    ["<leader>rha"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "Show hover actions",
    },
    ["<leader>rcu"] = {
      function()
        require("crates").update_all_crates()
      end,
      "Update all crates",
    },
    ["<leader>rcf"] = {
      function()
        require("crates").show_features_popup()
      end,
      "Show crate feature",
    },
    ["<leader>rcv"] = {
      function()
        require("crates").show_versions_popup()
      end,
      "Show crate versions",
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

M.lspconfig = {
  n = {
    ["<leader>ca"] = {
      "<cmd>CodeActionMenu<CR>",
      "Code action",
    },
  },
}

M.oatmeal = {
  n = {
    ["<leader>om"] = {
      function()
        require("oatmeal").start()
      end,
      "Start oatmeal",
    },
  },
  v = {
    ["<leader>om"] = {
      function()
        require("oatmeal").start()
      end,
      "Start oatmeal",
    },
  },
}

-- more keybinds!

return M
