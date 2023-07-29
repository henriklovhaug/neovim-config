local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local spec = {
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  config = function()
    require("rust-tools").setup {
      tools = {
        autoSetHints = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
        },
      },
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
  dependecies = "neovim/nvim-lspconfig",
}

return spec
