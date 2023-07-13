-- load impatient if found
--[[ if pcall(require, "impatient") then
else
  print("failed to load impatient")
end
 ]]
local options = {
    backup = false,                                     -- creates a backup file
    clipboard = "unnamed,unnamedplus",                  -- allows neovim to access the system clipboard
    cmdheight = 0,                                      -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect", "preview" }, -- mostly just for cmp
    conceallevel = 0,                                   -- so that `` is visible in markdown files
    colorcolumn = "120",
    fileencoding = "utf-8",                             -- the encoding written to a file
    hlsearch = false,                                   -- highlight all matches on previous search pattern
    ignorecase = true,                                  -- ignore case in search patterns
    mouse = "",                                         -- allow the mouse to be used in neovim
    pumheight = 40,                                     -- pop up menu height
    showmode = true,                                    -- we  to see things like -- INSERT
    showtabline = 0,                                    -- always show tabs
    smartcase = true,                                   -- smart case
    smartindent = true,                                 -- make indenting smarter again
    splitbelow = true,                                  -- force all horizontal splits to go below current window
    splitright = true,                                  -- force all vertical splits to go to the right of current window
    swapfile = false,                                   -- creates a swapfile
    termguicolors = true,                               -- set term gui colors (most terminals support this)
    -- timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = false,                                   -- enable persistent undo
    updatetime = 300,                                   -- faster completion (4000ms default)
    writebackup = false,                                -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                                   -- convert tabs to spaces
    shiftwidth = 2,                                     -- the number of spaces inserted for each indentation
    tabstop = 2,                                        -- insert 2 spaces for a tab
    cursorline = true,                                  -- highlight the current line
    cursorlineopt = { "line" },
    number = true,                                      -- set numbered lines
    laststatus = 3,
    showcmd = true,
    wildchar = ('\t'):byte(),
    ruler = true,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4,       -- set number column width to 2 {default 4}
    signcolumn = "yes:1",  -- always show the sign column, otherwise it would shift the text each time
    wrap = false,          --  display lines as one long line
    scrolloff = 8,         -- is one of my fav
    sidescrolloff = 8,
    -- guifont = "Fira mono for Powerline:h14", -- the font used in graphical neovim applications
    background = "dark",
    -- foldmethod = "expr",
    -- foldexpr = "nvim_treesitter#foldexpr()",
    -- spelllang = { "en", "en_us" },
    -- spelloptions = { "camel" },
}

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l" -- see: help whichwrap
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- vim.cmd "hi clear CursorLine"
-- vim.cmd "hi CursorLine gui=underline cterm=underline"
-- vim.cmd "unmap Y"
-- vim.cmd([[colorscheme kanagawa ]])
-- vim.cmd([[setlocal spell spelllang=en_us]])

vim.filetype.add({
    extension = {
        conf = "dosini",
    },
})


vim.g.mapleader = " "
vim.wo.foldlevel = 99
vim.o.background = "dark"
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd "ab arnav andav"
