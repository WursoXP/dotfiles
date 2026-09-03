return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	-- require("snacks")
	opts = {
		bigfile = { enabled = true },
		indent = {
			enabled = true,
			indent = {
				enabled = false,
			},
			scope = {
				underline = true,
				-- char = ".",
			},
			chunck = {
				enabled = true,
			},
			animate = {
				enabled = false,
			},
		},
		terminal = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		explorer = { enabled = true, trash = true },
		lazygit = { enabled = true },
		picker = {
			layout = "custom",
			layouts = {
				custom = {
					layout = {
						box = "horizontal",
						width = 0.9,
						min_width = 120,
						height = 0.85,
						border = false,
						{
							box = "vertical",
							border = "single",
							title = "{title} {live} {flags}",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = false },
						},
						{ win = "preview", title = "{preview}", border = "single", width = 0.5 },
					},
				},
			},
			sources = {
				files = {
					hidden = true, -- seu <leader>pf
				},
				explorer = {
					hidden = true,
					ignored = true,
					-- auto_close = true,
				},
			},
		},
		styles = {
			notification = {
				border = "single",
			},
			notification_history = {
				border = "single",
			},
		},
	},
	keys = {
    -- lazigit
    {
      "<a-p>",
      function ()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
		-- Terminal
		{
			"<leader>t",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle terminal",
		},
		-- Notifier
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer",
		},
		-- Find files (<leader>pf)
		{
			"<leader>pf",
			function()
				Snacks.picker.files()
			end,
			desc = "Files",
		},
			-- Find functions (<leader>pd)
		{
			"<leader>pd",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Functions",
		},	-- Git files (<C-p>)
		{
			"<C-p>",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		-- Grep word (<leader>pws)
		{
			"<leader>pws",
			function()
				Snacks.picker.grep_word()
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
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		-- Help tags (<leader>ph)
		{
			"<leader>ph",
			function()
				Snacks.picker.help()
			end,
			desc = "Help",
		},
	},
}
