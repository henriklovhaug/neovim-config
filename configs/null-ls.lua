local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "svelte", "scss", "yaml" },
    extra_filetypes = { "toml" },
  }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp", "cuda", "objc", "objcpp" },
  },

  -- Java
  b.formatting.google_java_format,

  -- rust
  b.formatting.rustfmt.with {
    extra_args = { "--edition=2021" },
  },

  -- sql
  -- b.diagnostics.sqlfluff.with {
  --   extra_args = { "--dialect", "postgres" }, -- change to your dialect
  -- },
  -- b.formatting.sqlfluff.with {
  --   extra_args = { "--dialect", "postgres" }, -- change to your dialect
  -- },

  -- docker
  b.diagnostics.hadolint,

  --latex
  b.formatting.latexindent,

  -- python
  b.diagnostics.mypy.with {
    extra_args = function()
      local virtual = os.getenv "VIRTUAL_ENV" or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  },
  b.diagnostics.ruff,
  b.formatting.black,

  -- xml
  b.formatting.xmlformat,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
