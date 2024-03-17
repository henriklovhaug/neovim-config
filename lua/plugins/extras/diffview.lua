---@type NvPluginSpec
local spec = {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  },
}

return spec
