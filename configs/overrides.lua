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
    "markdown",
    "markdown_inline",
    "rust",
    "go",
    "svelte",
    "dockerfile",
    "java",
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
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust
    "rust-analyzer",

    -- svelte
    "svelte-language-server",

    -- Docker compose
    "docker-compose-language-service",
    "dockerfile-language-server",
    "hadolint",

    -- sql
    "sqlfluff",
    "sqls",

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
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
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

return M
