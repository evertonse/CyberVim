local options = {
  backup          = false,                          -- creates a backup file
  clipboard       = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight       = 1,                           -- more space in the neovim command line for displaying messages
  completeopt     = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel    = 0,                        -- so that `` is visible in markdown files
  fileencoding    = "utf-8",                  -- the encoding written to a file
  hlsearch        = true,                         -- highlight all matches on previous search pattern
  incsearch       = true,                        -- Set Incremental search
  ignorecase      = true,                       -- ignore case in search patterns
  mouse           = "a",                             -- allow the mouse to be used in neovim
  pumheight       = 5,                          -- pop up menu height
  showmode        = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline     = 2,                         -- always show tabs
  smartcase       = false,                        -- smart case
  smartindent     = true,                      -- make indenting smarter again
  splitbelow      = true,                       -- force all horizontal splits to go below current window
  splitright      = true,                       -- force all vertical splits to go to the right of current window
  swapfile        = false,                        -- creates a swapfile
  termguicolors   = true,                    -- set term gui colors (most terminals support this)
  timeoutlen      = 75,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile        = true,                         -- enable persistent undo
  updatetime      = 50,                        -- faster completion (4000ms default)
  writebackup     = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab       = true,                        -- convert tabs to spaces
  tabstop         = 2,                             -- insert 2 spaces for a tab
  softtabstop     = 2,
  shiftwidth      = 2,                          -- the number of spaces inserted for each indentation
  cursorline      = true,                       -- highlight the current line
  number          = true,                           -- set numbered lines
  relativenumber  = true,                  -- set relative numbered lines
  numberwidth     = 1,                         -- set number column width to 2 {default 4}
  signcolumn      = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap            = false,                             -- display lines as one long line
  linebreak       = true,                        -- companion to wrap, don't split words
  scrolloff       = 5,                           -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff   = 5,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "MesloLGS NF:h11",               -- the font used in graphical neovim applications
  whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
--vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/vimfiles")  -- separate vim plugins from neovim in case vim still in use



-- Enable break indent
--vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.opt.termguicolors = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
