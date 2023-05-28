return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "leoluz/nvim-dap-go",
        config = function() require("dap-go").setup() end
      }
    },
    config = function()
      vim.keymap.set("n", '<leader>dc', function() require('dap').continue() end)
      vim.keymap.set("n", '<leader>db', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set("n", '<leader>dB', function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)
      vim.keymap.set("n", '<leader>dn', function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", '<leader>do', function()
        require("dap").step_out()
      end)
      vim.keymap.set("n", '<leader>di', function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.open()
      end)
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require("dapui").setup()
    end
  }
}
