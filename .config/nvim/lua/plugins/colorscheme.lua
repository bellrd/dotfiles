function DoTheThing(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

-- return {
--   {
--     'folke/tokyonight.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup {
--         style = "night",
--         transparent = true,
--       }
--       vim.cmd [[colorscheme tokyonight]]
--     end
--   }
-- }
--
-- Install without configuration
--
return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({})

      vim.cmd('colorscheme github_dark_high_contrast')
    end,
  }
}
