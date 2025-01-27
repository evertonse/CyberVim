local term_opts = { silent = true }
local opts = { noremap = true, silent = true }
-- WARNING, if any mapping is giving you trouble try:
-- for terminal
--    :verbose tmap <key you want>
--    :verbose nmap <key you want>
-- etc, replae n and t for v, x or i for different modes

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Straight Map, more general, can map key to a func, can accept more than one mode 
-- ex: map({'n','i'},<space>pr, function() print('hello') end, opts)
-- This means that <space>pr will run the function that print hello,
-- both insert mode and normal mode 
local map = vim.keymap.set

-- [[ Basic Keymaps ]]
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- Set <space> as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Normal --
-- Better window navigation
--dontwork--keymap("n", "<C-e>", "<C-w>h", opts)
--dontwork--keymap("n", "<C-j>", "<C-w>j", opts)
--dontwork--keymap("n", "<C-k>", "<C-w>k", opts)
--dontwork--keymap("n", "<C-q>", "<C-w>l", opts)
-- Resize with arrows

keymap("n", "<M-[>", ":resize -2<CR>", opts)
keymap("n", "<M-]>", ":resize +2<CR>", opts)
keymap("n", "<M-,>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-.>", ":vertical resize +2<CR>", opts)

--- keeping it centered
--keymap("n", "n", "nzzzv",opts)
--keymap("n", "N", "Nzzzv",opts)
--keymap("n", "J", "mzJ`z",opts)

--- moving text
keymap("v", "J", ":m '>+1<CR>gv=gv",opts)
keymap("v", "K", ":m '<-2<CR>gv=gv",opts)

-- Navigate buffers
--- behave like other capitals
keymap("n", "Y", "y$",opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==g", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==g", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move within insert mode
keymap('i', "<C-h>", "<Left>", opts)
keymap('i', "<C-l>", "<Right>", opts)
keymap('i', "<C-j>", "<Down>",  opts)
keymap('i', "<C-k>", "<Up>",    opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)

keymap("v", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- >> move fast with crtl Movinge
keymap("n", '<C-h>', "b", opts) 
keymap("n", '<C-l>', "e", opts) 

keymap("n", '<C-Left>', "b",opts)  
keymap("n", '<C-Right>', "e",opts)  

keymap('n', '<C-j>', "}",opts)
keymap('n', '<C-k>', "{",opts)

keymap('n', '<C-Up>', "{",opts)
keymap('n', '<C-Down>', "}",opts)

keymap("v", '<C-h>', "b", opts) 
keymap("v", '<C-l>', "e", opts) 

keymap("v", '<C-Left>', "b",opts)  
keymap("v", '<C-Right>', "e",opts)  

keymap('v', '<C-j>', "}",opts)
keymap('v', '<C-k>', "{",opts)

keymap('v', '<C-Up>', "{",opts)
keymap('v', '<C-Down>', "}",opts)

keymap('i', '<C-Up>',    "<C-o>{",opts)
keymap('i', '<C-Down>',  "<C-o>}",opts)

keymap('i', '<C-Left>',    "<C-o>b",      term_opts)
keymap('i', '<C-Right>',  "<C-o>e<Right>",term_opts)

keymap('i', '<C-v>', "<C-o><C-v>",opts)

-- << Move fast with crtl move

-- >> Shift Selection :
keymap('n', '<S-Up>', "v<Up>",opts)
keymap('n', '<S-Down>', "v<Down>",opts)

keymap('n', '<S-Left>', "<Left>v",opts)
keymap('n', '<S-Right>', "v",opts)

keymap('i', '<S-Up>', "<C-o>v<Up>",opts)
keymap('i', '<S-Down>', "<C-o>v<Down>",opts)

keymap('i', '<S-Left>', "<Left><C-o>v",opts)
keymap('i', '<S-Right>', "<C-o>v",opts)

--keymap('v', 'i', "<ESC><ESC>",opts)
keymap('v', '<S-Up>', "<Up>",opts)
keymap('v', '<S-Down>', "<Down>",opts)

keymap('v', '<S-Left>', "<Left>",opts)
keymap('v', '<S-Right>', "<Right>",opts)
-- << Shift Selection :

-- >> Set back and forth in code to be Alt keys
keymap('n', '<M-Left>', "<C-o>",opts)
keymap('n', '<M-Right>', "<C-i>",opts)
-- << Shift Selection :
-- <<

-- Keymaps for better default experience
-- See `:help keymap()`
map({"x", 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
keymap('x',"p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)
keymap('v',"p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)

keymap("n", '<M-Up>', "ddkP",opts) --// Moving the line up
keymap("n", '<M-Down>', "ddjP",opts) -- // Moving the line down

-- @NotImplemented idea for going back and forth between buffers
local keymappings = {
  ['key'] = {
      -- cycle through buffers
      ["<TAB>"] = {
        function()
          require("nvchad_ui.tabufline").tabuflineNext()
        end,
        "goto next buffer",
      },

      ["<S-Tab>"] = {
        function()
          require("nvchad_ui.tabufline").tabuflinePrev()
        end,
        "goto prev buffer",
      },
  }
}

--keymap("i", '<C-s>', "<C-o>:w<CR>",opts) -- saving with crt + s on insert mode 
--keymap("n", '<C-s>', ":w<CR>", opts) -- saving with crt + s on insert mode 

keymap("v", '<M-Up>', ":m '<-2<CR>gv=gv",opts)
keymap("v", '<M-Down', ":m '>+2<CR>gv=gv",opts)

--keymap("n", "J", "mzJ`z",opts)
keymap("n", "<C-d>", "<C-d>zz",opts)
keymap("n", "<C-u>", "<C-u>zz",opts)
keymap("n", "n", "nzz" ,opts)
keymap("n", "N", "Nzz" ,opts)

-- greatest remap ever
keymap("x", "<leader>p", '"_dP',opts)

-- >> Clip Board option 
keymap("n", "<leader>y", '"_y',opts)
keymap("v", "<leader>y", '"_y',opts)
keymap("n", "<leader>Y", '"_Y',opts)

map({'n','x','v'}, "<leader>d", "\"_d",opts)

map({'n','x','v'}, "<leader>D", '"_D',opts)

map({'n','x','v'}, "<leader>p", '"_p',opts)

map({'n','x','v'}, "x", '"_x',opts)
-- << Clip Board options


-- Maybe the same button for entering in both modes ??
keymap("i", "<C-c>", "<Esc>",opts)
--keymap("x", "<C-c>", "<Esc>",opts)

keymap("n", "Q", "<nop>",opts)
--Dont know what this does--keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- No Need, already define in which key
--[[
map("n", "<leader>for", function()
  vim.lsp.buf.format()
end)
--]]

--keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
--keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
--keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
--keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev,opts)
map('n', ']d', vim.diagnostic.goto_next,opts)


-- Shift Uab undident line 

-- <leader>te [T]oggleT[E]rm
--keymap('n', '<leader>te',':ToggleTerm<CR>',opts)
-- make it work on Terminal mode

-- Undo with A-u on insert mode is alredy a thing
-- Undo with C-u on insert mode 
keymap('i', '<M-U>','<C-o><C-r>',opts) 
keymap('n', 'U','<C-r>',opts) 

-- <leader>a already does ths 
--keymap('n', '<leader>ds',':Alpha<CR>',opts)

--[R][E]place shortcut 
keymap('v', '<leader>re',  'y:%s/<C-r>*/<C-r>*/gc<Left><Left><Left><Down>', opts)
keymap('n', '<leader>re', 'yW:%s/<C-r>*/<C-r>*/gc<Left><Left><Left><Down>', opts)
--[R]eplace [A]ll shortcut 
keymap('v', '<leader>ra',  'y:%s/<C-r>*/<C-r>*/<Left><Down>', opts)
keymap('n', '<leader>ra', 'yW:%s/<C-r>*/<C-r>*/<Left><Down>', opts)
--[S][E]arch shortcut 
keymap("n", "<leader>se", "yW/<C-r>*<Down>",opts)

map({"n",'i','v','x'}, "<F1>", "<ESC><ESC>:<Down>",opts)

map({'n','v','x'}, "ge", "G", opts)
map({'n','v','x'}, "gh", "0", opts)
map({'n','v','x'}, "gl", "$", opts)


map({'n','v','x'}, "<leader>s", "\"_s",opts)

