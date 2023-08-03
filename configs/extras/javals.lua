local spec = {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    require("jdtls").start_or_attach {
      cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:/home/henrik/.local/share/nvim/mason/packages/jdtls/lombok.jar"
      },
      root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml" },
      on_attach = require("plugins.configs.lspconfig").on_attach,
      capabilities = require("plugins.configs.lspconfig").capabilities,
    }
  end,
  dependencies = "neovim/nvim-lspconfig",
}

return spec
