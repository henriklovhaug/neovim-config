local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local spec = {
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  config = function()
    require("rust-tools").setup {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
  dependencies = "neovim/nvim-lspconfig",
}

return spec
