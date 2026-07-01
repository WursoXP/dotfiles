return {
  "nvim-pack/nvim-spectre",
  dependencies = "nvim-lua/plenary.nvim",

  opts = {},

  keys = {
    -- Explorer
    { "<leader>s", function() require("spectre").toggle() end, desc = "Toggle explorer" },
  },
}
