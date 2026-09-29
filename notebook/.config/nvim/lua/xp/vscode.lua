vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>pv", function()
  vim.fn.VSCodeNotify("workbench.view.explorer")
end, { desc = "Open Explorer" })

-- tabs
vim.keymap.set("n", "<c-t>", function()
  vim.fn.VSCodeNotify("workbench.action.files.newUntitledFile")
end, { desc = "New file" })

vim.keymap.set({"n", "i"}, "<a-q>", function()
  vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end, { desc = "Close tab" })

vim.keymap.set({"n", "i"}, "<a-1>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex1")
end)

vim.keymap.set({"n", "i"}, "<a-2>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex2")
end)

vim.keymap.set({"n", "i"}, "<a-3>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex3")
end)

vim.keymap.set({"n", "i"}, "<a-4>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex4")
end)

vim.keymap.set({"n", "i"}, "<a-5>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex5")
end)

vim.keymap.set({"n", "i"}, "<a-6>", function()
  vim.fn.VSCodeNotify("workbench.action.openEditorAtIndex6")
end)


-- move linhas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])


-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- leitura
vim.keymap.set("n", "<leader>le1", function()
  vim.fn.VSCodeNotify("editor.action.toggleWordWrap")
end, { desc = "Toggle Wrap" })


-- LSP / VSCode
vim.keymap.set("n", "gd", function()
  vim.fn.VSCodeNotify("editor.action.revealDefinition")
end, { desc = "Goto Function Definition" })


vim.keymap.set("n", "gD", function()
  vim.fn.VSCodeNotify("editor.action.revealDefinitionAside")
end, { desc = "Goto Function Definition in new tab" })


vim.keymap.set("n", "gF", function()
  vim.fn.VSCodeNotify("editor.action.openLink")
end, { desc = "Open link" })


-- FORMATTER
vim.keymap.set("n", "<leader>f", function()
  vim.fn.VSCodeNotify("editor.action.formatDocument")
end, { desc = "Format document" })
