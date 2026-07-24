local function ColorMyTerminal()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = false,
		color_overrides = {
			mocha = {
				base = "#010101",
				mantle = "#020202",
				crust = "#030303",
		      },
		    },
		highlight_overrides = {
			mocha = function()
				return {
					LineNr       = { fg = "#7e57c2" },
					VertSplit    = { fg = "#7e57c2" },
					StatusLine   = { fg = "#7e57c2", bg = "#1a003e" },
					StatusLineNC = { fg = "#7e57c2", bg = "#000000" },
					Identifier   = { fg = "#00a2e8" },  -- Kris
					Keyword      = { fg = "#ae67af" },  -- Susie
					Constant     = { fg = "#4ecc8f" },  -- Ralsei
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
  {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
  }
}


