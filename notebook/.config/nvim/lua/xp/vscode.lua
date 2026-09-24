vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- tabs
vim.keymap.set("n", "<c-t>", ":tabnew<CR>")
vim.keymap.set({"n", "i"}, "<a-q>", ":tabclose<CR>")
vim.keymap.set({"n", "i"}, "<a-1>", "<Esc>1gt")
vim.keymap.set({"n", "i"}, "<a-2>", "<Esc>2gt")
vim.keymap.set({"n", "i"}, "<a-3>", "<Esc>3gt")
vim.keymap.set({"n", "i"}, "<a-4>", "<Esc>4gt")
vim.keymap.set({"n", "i"}, "<a-5>", "<Esc>5gt")
vim.keymap.set({"n", "i"}, "<a-6>", "<Esc>6gt")

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
vim.keymap.set('n', '<leader>le1', ':set wrap!<CR>', { desc = 'Toggle Wrap' })
vim.keymap.set('n', '<leader>le2', ':set linebreak!<CR>', { desc = 'Toggle Wrap' })

-- lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Function Definition' })
vim.keymap.set('n', 'gD',
				function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          local encoding = #clients > 0 and clients[1].offset_encoding or 'utf-16'
          local params = vim.lsp.util.make_position_params(0, encoding)
          local results = vim.lsp.buf_request_sync(0, 'textDocument/definition', params, 1000)
          local ok = vim.inspect(results[2].result)
          if ok ~= "nil" then
            vim.cmd('tab split')
            vim.lsp.buf.definition()
          end
          print('')
				end,
        { desc = 'Goto Function Definition in new tab' }
      )

-- vim.keymap.set('n', 'gD',
-- 				function()
--           vim.cmd('tab split')
--           vim.lsp.buf.definition()
-- 				end,
--         { desc = 'Goto Function Definition in new tab' }
--       )
vim.keymap.set('n', 'gF',
				function()
          vim.cmd('tab split')
          local ok = pcall(vim.cmd, 'normal! gf')
          if not ok then
            vim.cmd('tabclose')
            vim.cmd('normal! gT')
            return
          end
				end,
        { desc = 'Goto Function Definition in new tab' }
      )

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
