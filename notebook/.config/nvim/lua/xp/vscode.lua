local vscode = require('vscode')

vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>pv", function()
  vscode.action("workbench.view.explorer")
end, { desc = "Open Explorer" })

-- tabs
vim.keymap.set("n", "<c-t>", function()
  vscode.action("workbench.action.files.newUntitledFile")
end, { desc = "New file" })

vim.keymap.set({"n", "i"}, "<a-q>", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close tab" })

vim.keymap.set({"n", "i"}, "<a-1>", function()
  vscode.action("workbench.action.openEditorAtIndex1")
end)

vim.keymap.set({"n", "i"}, "<a-2>", function()
  vscode.action("workbench.action.openEditorAtIndex2")
end)

vim.keymap.set({"n", "i"}, "<a-3>", function()
  vscode.action("workbench.action.openEditorAtIndex3")
end)

vim.keymap.set({"n", "i"}, "<a-4>", function()
  vscode.action("workbench.action.openEditorAtIndex4")
end)

vim.keymap.set({"n", "i"}, "<a-5>", function()
  vscode.action("workbench.action.openEditorAtIndex5")
end)

vim.keymap.set({"n", "i"}, "<a-6>", function()
  vscode.action("workbench.action.openEditorAtIndex6")
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
  vscode.action("editor.action.toggleWordWrap")
end, { desc = "Toggle Wrap" })


-- LSP / VSCode
vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end, { desc = "Goto Function Definition" })

vim.keymap.set("n", "gD", function()
  vscode.action("editor.action.peekDefinition")
end, { desc = "Goto Function Definition in new tab" })


vim.keymap.set("n", "gf", function()
  vscode.action("editor.action.revealDeclaration")
end, { desc = "Open link" })

vim.keymap.set("n", "gF", function()
  vscode.action("editor.action.peekDeclaration")
end, { desc = "Open link" })


-- FORMATTER
vim.keymap.set("n", "<leader>ff", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format document" })


