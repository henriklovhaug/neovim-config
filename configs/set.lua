vim.opt.scrolloff = 8
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.fn.setenv("NVIM", "nvim")

vim.g.gutentags_ctags_tagfile = ".tags"
vim.g.gutentags_file_list_command = "rg --files"
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_project_root = { "go.mod", ".git", ".tags" }
