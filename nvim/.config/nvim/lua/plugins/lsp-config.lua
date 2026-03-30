return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 1) merge/override the server default config (optional)
      --    This sets/merges the capabilities into the server config.
      --    Use the server name exactly as nvim-lspconfig exposes it (see note below).
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      -- If your setup previously used tsserver, try "ts_ls" first (or "tsserver" depending on your lspconfig version)
      vim.lsp.config("ts_ls", { capabilities = capabilities }) -- or "tsserver"

      -- 2) enable the server so it auto-activates for matching filetypes / root markers
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls") -- or "tsserver"

      -- 3) your keymaps (no change)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to References" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    end,
  },
}
