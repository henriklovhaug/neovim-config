-- java lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- disable jdtls config from lspconfig
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local on_attach = function(client, bufnr)
        require("plugins.configs.lspconfig").on_attach(client, bufnr)
      end

      local capabilities = require("plugins.configs.lspconfig").capabilities
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      -- calculate workspace dir
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      -- get the mason install path
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
      local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
      local bundles = {
        -- "/home/henrik/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.49.0/com.microsoft.java.debug.plugin-0.49.0.jar",
        vim.fn.glob(debug_install_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
      }

      local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()
      vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))

      -- vim.list_extend(
      --   bundles,
      --   vim.split(
      --     vim.fn.glob("/home/henrik/.vscode-server/extensions/vscjava.vscode-java-test-0.39.1/server/*.jar", 1),
      --     "\n"
      --   )
      -- )

      local config = {
        cmd = {
          install_path .. "/bin/jdtls",
          "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          -- '-noverify',
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-data",
          workspace_dir,
        },
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
        ),

        settings = {
          java = {
            signatureHelp = { enabled = true },
          },
        },

        init_options = {
          bundles = bundles,
        },
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}

-- local spec = {
--   -- "neovim/nvim-lspconfig",
--   "mfussenegger/nvim-jdtls",
--   -- dependencies = { "mfussenegger/nvim-jdtls" },
--   ft = { "java" },
--   opts = {
--     setup = {
--       jdtls = function()
--         vim.api.nvim_create_autocmd("FileType", {
--           pattern = "java",
--           callback = function()
--             require("plugins.configs.lspconfig").on_attach(function(_, buffer)
--               vim.keymap.set(
--                 "n",
--                 "<leader>di",
--                 "<Cmd>lua require'jdtls'.organize_imports()<CR>",
--                 { buffer = buffer, desc = "Organize Imports" }
--               )
--               vim.keymap.set(
--                 "n",
--                 "<leader>dt",
--                 "<Cmd>lua require'jdtls'.test_class()<CR>",
--                 { buffer = buffer, desc = "Test Class" }
--               )
--               vim.keymap.set(
--                 "n",
--                 "<leader>dn",
--                 "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
--                 { buffer = buffer, desc = "Test Nearest Method" }
--               )
--               vim.keymap.set(
--                 "v",
--                 "<leader>de",
--                 "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
--                 { buffer = buffer, desc = "Extract Variable" }
--               )
--               vim.keymap.set(
--                 "n",
--                 "<leader>de",
--                 "<Cmd>lua require('jdtls').extract_variable()<CR>",
--                 { buffer = buffer, desc = "Extract Variable" }
--               )
--               vim.keymap.set(
--                 "v",
--                 "<leader>dm",
--                 "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
--                 { buffer = buffer, desc = "Extract Method" }
--               )
--               vim.keymap.set(
--                 "n",
--                 "<leader>cf",
--                 "<cmd>lua vim.lsp.buf.formatting()<CR>",
--                 { buffer = buffer, desc = "Format" }
--               )
--             end)
--
--             local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
--             -- vim.lsp.set_log_level('DEBUG')
--             local workspace_dir = "/home/henrik/.workspace/" .. project_name -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--             local config = {
--               -- The command that starts the language server
--               -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--               cmd = {
--
--                 "java", -- or '/path/to/java17_or_newer/bin/java'
--                 -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--                 "-javaagent:/home/henrik/.local/share/nvim/mason/packages/jdtls/lombok.jar",
--                 -- '-Xbootclasspath/a:/home/jake/.local/share/java/lombok.jar',
--                 "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--                 "-Dosgi.bundles.defaultStartLevel=4",
--                 "-Declipse.product=org.eclipse.jdt.ls.core.product",
--                 "-Dlog.protocol=true",
--                 "-Dlog.level=ALL",
--                 -- '-noverify',
--                 "-Xms1g",
--                 "--add-modules=ALL-SYSTEM",
--                 "--add-opens",
--                 "java.base/java.util=ALL-UNNAMED",
--                 "--add-opens",
--                 "java.base/java.lang=ALL-UNNAMED",
--                 "-jar",
--                 vim.fn.glob "/home/henrik/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
--                 -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--                 -- Must point to the                                                     Change this to
--                 -- eclipse.jdt.ls installation                                           the actual version
--
--                 "-configuration",
--                 "/home/henrik/.local/share/nvim/mason/packages/jdtls/config_linux/config.ini",
--                 -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                 -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                 -- eclipse.jdt.ls installation            Depending on your system.
--
--                 -- See `data directory configuration` section in the README
--                 "-data",
--                 workspace_dir,
--               },
--
--               -- This is the default if not provided, you can remove it. Or adjust as needed.
--               -- One dedicated LSP server & client will be started per unique root_dir
--
--               -- Here you can configure eclipse.jdt.ls specific settings
--               -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--               -- for a list of options
--               settings = {
--                 java = {},
--               },
--               handlers = {
--                 ["language/status"] = function()
--                   -- print(result)
--                 end,
--                 ["$/progress"] = function()
--                   -- disable progress updates.
--                 end,
--               },
--             }
--             require("jdtls").start_or_attach(config)
--           end,
--         })
--         return true
--       end,
--     },
--   },
-- }
--
-- return spec
