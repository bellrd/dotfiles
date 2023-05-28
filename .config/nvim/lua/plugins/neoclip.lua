return {
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup({})
      require('telescope').load_extension('neoclip')
      vim.keymap.set("n", "<leader>y", function()
        vim.cmd("Telescope neoclip")
      end)
    end
  }
}
