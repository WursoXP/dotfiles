return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 5000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				elixir = { "mix" },
				html = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = {
					"ruff_fix",
					"ruff_organize_imports",
					"ruff_format",
				},
				htmldjango = { "djlint" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
