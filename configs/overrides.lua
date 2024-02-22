local cmp = require "cmp"
local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
    "rust",
    "go",
    "svelte",
    "dockerfile",
    "java",
    "latex",
    "python",
    "json",
    "prisma",
    "sql",
    "regex",
    "kotlin",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",
    "prettier",
    "htmx-lsp",
    --tailwindcss
    "tailwindcss-language-server",

    --python stuff
    "pyright",
    "mypy",
    "ruff",
    "blue",
    "debugpy",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust
    "rust-analyzer",
    "codelldb",

    -- svelte
    "svelte-language-server",

    -- Docker compose
    "docker-compose-language-service",
    "dockerfile-language-server",
    "hadolint",

    -- sql
    "sqlfluff",
    "sqls",
    "prisma-language-server",

    -- go
    "gopls",
    "glint",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gotestsum",

    -- java
    "jdtls",
    "google-java-format",
    "java-test",
    "vscode-java-decompiler",
    "java-debug-adapter",
    "checkstyle",

    -- latex
    "texlab",

    -- markdown
    "glow",
    "marksman",
    "ltex-ls",

    -- xml
    "xmlformatter",

    -- cli
    "ast-grep",
    "trivy",
    "gitui",
    "zk",

    -- shell
    "beautysh",

    -- Pest
    "pest-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    adaptive_size = true,
    -- To be decided
    -- side = "right",
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    generic_sorter = require("telescope.sorters").get_fzy_sorter,
  },
}

local A = require "plugins.configs.cmp"
table.insert(A.sources, { name = "crates" })

M.cmp = {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
  },
  sources = A.sources,
  completion = { completeopt = "menu,menuone,noinsert,noselect" },
}

return M
