local function ColorMyTerminal()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = false,
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#1e004f",
				crust = "#1a003e",
		      },
		    },
		highlight_overrides = {
			mocha = function()
				return {
					LineNr       = { fg = "#7e57c2" },
					VertSplit    = { fg = "#7e57c2" },
					StatusLine   = { fg = "#7e57c2", bg = "#1a003e" },
					StatusLineNC = { fg = "#7e57c2", bg = "#000000" },
					Identifier   = { fg = "#9bffaf" },  -- Kris
					Keyword      = { fg = "#c27ba0" },  -- Susie
					Constant     = { fg = "#fff88f" },  -- Ralsei
				}
			end,
		},
	})

	vim.cmd.colorscheme("catppuccin")
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			ColorMyTerminal()
		end,
	},
}
