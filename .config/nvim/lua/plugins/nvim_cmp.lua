local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
return {
  {
    'hrsh7th/nvim-cmp', -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      local cmp = require("cmp")
      -- If you want insert `(` after select function or method item
      -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      -- local luasnip = require("luasnip");
      -- cmp.event:on(
      --   'confirm_done',
      --   cmp_autopairs.on_confirm_done()
      -- )
      local lspkind = require("lspkind")
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
      cmp.setup {
        mapping = {
          ['C-n'] = cmp.select_next_item,
          ['C-p'] = cmp.select_prev_item,
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            { name = "nvim_lua" },
            { name = "path" },
          },
          {
            { name = 'buffer', keyword_length = 3 },
          }
        ),

        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',       -- show only symbol annotations
            maxwidth = 80,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          })
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = false,
        }
      }
    end
  }
}
