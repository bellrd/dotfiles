return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "someone-stole-my-name/yaml-companion.nvim" },
    config = function()
      -- lua
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }
      -- rust
      require 'lspconfig'.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            }
          }
        }
      }
      -- go
      require 'lspconfig'.gopls.setup {}
      -- dart
      require 'lspconfig'.dartls.setup {}
      -- yaml
      local cfg = require("yaml-companion").setup({})
      require('lspconfig').yamlls.setup(cfg)
      -- json
      require 'lspconfig'.jsonls.setup {}
      -- js ts
      require 'lspconfig'.tsserver.setup {}
    end,
  },
}
