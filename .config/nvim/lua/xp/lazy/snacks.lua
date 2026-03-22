return {
    "folke/snacks.nvim",
    lazy= false,
    opts = {
        picker = {
            sources = {
                files = {
                    hidden = true,  -- seu <leader>pf
                },
            },
        },
    },
    keys = {
        -- Find files (<leader>pf)
        { "<leader>pf", function() Snacks.picker.files() end, desc = "Files" },
        -- Git files (<C-p>)
        { "<C-p>", function() Snacks.picker.git_files() end, desc = "Git Files" },
        -- Grep word (<leader>pws)
        {
            "<leader>pws",
            function()
                Snacks.picker.grep({ default_text = vim.fn.expand("<cword>") })
            end,
            desc = "Grep Word",
        },
        -- Grep WORD (<leader>pWs)
        {
            "<leader>pWs",
            function()
                Snacks.picker.grep({ default_text = vim.fn.expand("<cWORD>") })
            end,
            desc = "Grep WORD",
        },
        -- Grep prompt (<leader>ps)
        {
            "<leader>ps",
            function ()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        -- Help tags (<leader>ph)
        { "<leader>ph", function() Snacks.picker.help() end, desc = "Help" },
    },
}
