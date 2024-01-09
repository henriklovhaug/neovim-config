local spec = {
  "zk-org/zk-nvim",
  ft = { "markdown" },
  config = function()
    require("zk").setup {}
  end,
}

return spec
