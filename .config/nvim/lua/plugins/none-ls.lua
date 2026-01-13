return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,    -- javascript or typescript
        null_ls.builtins.diagnostics.eslint_d,   -- javascript or typescript

        --Python
        -- black => formatter
        -- isort => formatting imports
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format File" })
	end,
}



