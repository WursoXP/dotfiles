return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- habilita em todos os tipos de arquivo
    })
  end,
}
