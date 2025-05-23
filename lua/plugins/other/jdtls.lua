-- java lsp
local my_attach = function(client, bufnr)
	require("nvchad.configs.lspconfig").on_attach(client, bufnr)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		require("actions-preview").code_actions()
	end, { desc = "Code actions", noremap = true, silent = true, buffer = bufnr })
	vim.lsp.inlay_hint.enable(true)
end

local map = vim.keymap.set

local plugin = {
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
		dependecies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap")

			local capabilities = require("nvchad.configs.lspconfig").capabilities
			local on_init = require("nvchad.configs.lspconfig").on_init
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			-- calculate workspace dir
			local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
			-- get the mason install path
			local install_path = vim.fn.exepath("jdtls")
			-- get the debug adapter install path
			local debug_install_path = vim.fn.expand("$MASON/share/java-debug-adapter")
			local bundles = {
				vim.fn.glob(debug_install_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
			}

			-- Comment out these lines if you have 'java-test' installed
      local java_test_path = vim.fn.expand("$MASON/share/java-test")
			vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))

			local config = {
				cmd = {
					install_path .. "/bin/jdtls",
					"--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.protocol=true",
					"-Dlog.level=ALL",
					"-Xms1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-data",
					workspace_dir,
				},
				on_attach = my_attach,
				capabilities = capabilities,
				on_init = on_init,
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

			map({ "n" }, "<Leader>ds", function()
				require("jdtls.dap").setup_dap_main_class_configs()
			end, { desc = "Set up debugging", noremap = true, silent = true })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					require("jdtls").start_or_attach(config)
				end,
			})
		end,
	},
}

return plugin
