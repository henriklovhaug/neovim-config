local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "svelte", "scss" },
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
  b.diagnostics.checkstyle.with {
    extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
  },

  -- rust
  b.formatting.rustfmt.with {
    extra_args = { "--edition=2021" },
  },

  -- sql
  b.diagnostics.sqlfluff.with {
    extra_args = { "--dialect", "postgres" }, -- change to your dialect
  },
  b.formatting.sqlfluff.with {
    extra_args = { "--dialect", "postgres" }, -- change to your dialect
  },

  -- docker
  b.diagnostics.hadolint,

  --latex
  b.formatting.latexindent,

  -- python
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.formatting.black,

  -- xml
  b.formatting.xmlformat,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
