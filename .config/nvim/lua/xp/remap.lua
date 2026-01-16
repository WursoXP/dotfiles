vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Terminal
vim.keymap.set("n","<leader>t", function ()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
end)




--===============================================================================================-
-- Função para buscar PID do live-server rodando no diretório atual
local function find_live_server_pid_for_dir(dir)
    local output = vim.fn.systemlist('pgrep -af live-server')
    for _, line in ipairs(output) do
        -- Cada linha tem formato: "<pid> comando completo"
        local pid, cmd = line:match("^(%d+)%s+(.+)$")
        if pid and cmd then
            -- Verifica se o caminho do live-server no comando contém o diretório atual
            -- Aqui assumimos que o live-server recebe o caminho do diretório como argumento
            if cmd:find(dir, 1, true) then
                return pid
            end
        end
    end
    return nil
end

-- Abrir live-server (F5)
vim.keymap.set("n", "<F5>", function()
    local file = vim.api.nvim_buf_get_name(0)
    local ext = vim.fn.fnamemodify(file, ":e")
    local dir = vim.fn.fnamemodify(file, ":p:h")
    local name_without_ext = vim.fn.fnamemodify(file, ":t:r") -- nome sem extensão

    if ext == "html" then
        local pid = find_live_server_pid_for_dir(dir)
        if pid then
            print("⚠️ live-server já está rodando para este diretório! PID: " .. pid)
            return
        end
        -- inicia live-server
        vim.fn.jobstart({ "live-server", "--browser=firefox", dir}, {
            detach = true,
            cwd = dir,
        })
        -- inicia sass
        --local sass_src = dir .. "/scss"
        --local sass_dest = dir .. "/css"
        --vim.fn.mkdir(sass_dest, "p")
        --vim.fn.jobstart({ "sass", "--watch", sass_src .. ":" .. sass_dest }, {
        --detach = true,
        --cwd = dir,
        --})

        print("🌐 live-server iniciado em: " .. dir)

    elseif ext == "c" then

        -- Compilar com gcc
        local output_bin = dir .. "/" .. name_without_ext
        local compile_cmd = string.format("gcc %s -o %s", file, output_bin)
        local compile_output = vim.fn.systemlist(compile_cmd)

        if vim.v.shell_error ~= 0 then
            print("❌ Erro na compilação:")
            for _, line in ipairs(compile_output) do
                print(line)
            end
            return
        end

        print("✅ Compilado com sucesso: " .. output_bin)

        local job_id = vim.fn.jobstart({ "foot", "-e", output_bin }, { detach = true })

        if job_id <= 0 then
            print("❌ Falha ao iniciar terminal. Verifique se 'foot' está instalado.")
        else
            print("🎉 Executando em terminal: " .. output_bin)
        end    
    else
        print("❌ Esse atalho só funciona com arquivos .html ou .c")
    end
end, { desc = "Abrir live-server com F5 ou compilar .c", silent = true })

-- Matar live-server (F6)
vim.keymap.set("n", "<F6>", function()
    local file = vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(file, ":p:h")

    local pid = find_live_server_pid_for_dir(dir)
    if not pid then
        print("⚠️ Nenhum processo live-server encontrado para este diretório.")
        return
    end

    vim.fn.system('kill ' .. pid)
    print("🛑 live-server finalizado! PID morto: " .. pid)
end, { desc = "Matar live-server com F6", silent = true })

