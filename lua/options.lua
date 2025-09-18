require("nvchad.options")

-- add yours here!

local o = vim.opt

o.scrolloff = 8
o.smartindent = true

o.hlsearch = false
o.incsearch = true

vim.diagnostic.config({
	update_in_insert = false,
})

vim.g.tex_flavor = "latex"

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
	local value = result.value
	if not value.kind then
		return
	end

	local client_id = ctx.client_id
	local name = vim.lsp.get_client_by_id(client_id).name

	if name == "ltex-plus" then
		if result.token == ltex_token then
			return
		end
		if value.title == "Checking document" then
			ltex_token = result.token
			return
		end
	end
end
