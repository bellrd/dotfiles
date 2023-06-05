vim.g.mapleader = " "
vim.wo.foldlevel = 99
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "H", vim.cmd.bp)
vim.keymap.set("n", "L", vim.cmd.bn)
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>;", vim.cmd.bd)
vim.keymap.set("n", "<leader>o", vim.cmd.only)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    vim.diagnostic.config { update_in_insert = true, float = { border = "rounded" } }

    -- Global mappings.
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<leader> D', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n', '<leader>fs', function() vim.cmd('Telescope lsp_document_symbols') end)
    vim.keymap.set('n', '<leader>fS', function() vim.cmd('Telescope lsp_workspace_symbols') end)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { sync = true } end, opts)

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        if (vim.bo.filetype == 'go')
        then
          require('go.format').goimport()
        else
          vim.lsp.buf.format()
        end
      end,
      group = format_sync_grp,
    })
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  end,
})

vim.keymap.set('n', '<leader>a', function() vim.cmd('NvimTreeToggle') end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    vim.keymap.set("n", "K", function()
      require("rest-nvim").run()
    end)
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.api.nvim_create_user_command("Yls", function()
      require("yaml-companion").open_ui_select();
    end, {})
  end
})
