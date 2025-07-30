return {
    "saghen/blink.cmp",
    version = "1.*",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    config = function ()
        require("blink.cmp").setup({
            keymap = { preset = 'super-tab' },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { "lsp", "snippets", "path", "buffer" },
                providers = {
                    lsp = {
                        min_keyword_length = 2, -- Number of characters to trigger provider
                        score_offset = 0, -- Boost/penalize the score of the items
                    },
                    path = {
                        min_keyword_length = 0,
                    },
                    snippets = {
                        min_keyword_length = 0,
                    },
                    buffer = {
                        min_keyword_length = 5,
                        max_items = 5,
                    },
                },
            },
            completion = {
                accept = { auto_brackets = { enabled = true } },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 50,
                    treesitter_highlighting = true,
                    --window = { border = "rounded" },
                },
            },
        })
    end
}
