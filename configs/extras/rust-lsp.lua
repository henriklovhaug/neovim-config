-- local spec = {
--   "mrcjkb/rustaceanvim",
--   version = "^3", -- Recommended
--   ft = { "rust" },
-- }

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

        settings = {
          ["rust-analyzer"] = {
            -- Other Settings ...
            procMacro = {
              ignored = {
                leptos_macro = {
                  -- optional: --
                  -- "component",
                  "server",
                },
              },
            },
          },
        },
      },
    }
  end,
  dependencies = "neovim/nvim-lspconfig",
}
return spec
