local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

local local_sources = { "tricorder" }
local local_source_objects = {}

for _, local_source in pairs(local_sources) do
	local loaded, local_source_object = pcall(require, "user.lsp.settings." .. local_source)
	if loaded then
		table.insert(local_source_objects, local_source_object)
	else
		print(local_source .. " doesn't exist.")
	end
end

local sources = {
	formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	formatting.puppet_lint,
	diagnostics.shellcheck,
	diagnostics.proselint,
	diagnostics.puppet_lint,
	code_actions.gitsigns,
	code_actions.gitrebase,
	code_actions.shellcheck,
	code_actions.refactoring,
	code_actions.proselint,
}

for _, v in ipairs(local_source_objects) do
	table.insert(sources, v)
end

null_ls.setup({
	debug = false,
	sources = sources,
})
