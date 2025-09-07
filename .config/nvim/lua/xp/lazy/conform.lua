return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                elixir = { "mix" },
                html = { "prettier" },
                css = { "prettier" },
                c = { "clang-format" },
                cpp = { "clang-format" }
            }
        })
    end
}

