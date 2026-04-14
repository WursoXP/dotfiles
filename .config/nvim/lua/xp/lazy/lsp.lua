return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"stevearc/conform.nvim",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"L3MON4D3/LuaSnip",
			"j-hui/fidget.nvim",
			"saghen/blink.cmp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			require("conform").setup({
				formatters_by_ft = {},
			})

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"stylua",
					"rust_analyzer",
					"clangd",
					"ty",
          "basedpyright",
          "djlsp",
					"glsl_analyzer",
					"zls",
				},
				automatic_enable = true,
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"ruff",
				},
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- vim.lsp.enable({
			--     "lua_ls",
			--     "rust_analyzer",
			--     "clangd",
			--     "ty",
			--     "glsl_analyzer",
			--     "zls",
			-- })

			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = {
					severity = { min = vim.diagnostic.severity.HINT },
				},
				float = {
					focusable = false,
					style = "minimal",
					border = "single",
					source = true,
					header = "",
					prefix = "",
				},
			})

			vim.g.zig_fmt_parse_errors = 0
			vim.g.zig_fmt_autosave = 0
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = false,
				keymap = {
					accept = "<C-l>",
					accept_word = "<M-l>",
					accept_line = "<M-S-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
}
