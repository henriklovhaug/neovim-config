local spec = {
  "mickael-menu/zk-nvim",
  ft = { "markdown" },
  config = function()
    require("zk").setup {}
  end,
}

return spec
