-- local opts = { noremap = true, silent = true }
-- function addName(desc) -- to opts
--   local newTable = {}
--   for k, v in pairs(opts) do
--     newTable[k] = v
--   end
--   newTable.desc = desc
--   return newTable
-- end
function opts(desc)
  desc = desc or ''
  return { desc = desc, noremap = true, silent = true }
end

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts())
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts())
keymap("n", "<C-j>", "<C-w>j", opts())
keymap("n", "<C-k>", "<C-w>k", opts())
keymap("n", "<C-l>", "<C-w>l", opts())

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts())
keymap("n", "<C-Down>", ":resize +2<CR>", opts())
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts())
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts())

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts())
keymap("n", "<S-h>", ":bprevious<CR>", opts())

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts())
keymap("n", "<A-k>", ":m .-2<CR>==", opts())

-- Closing and saving things
keymap("n", "<leader>q", "<cmd>q<cr>", opts("Quit"))
keymap("n", "<leader>w", "<cmd>w<cr>", opts("Save"))
keymap("n", "<leader>c", "<cmd>bd<cr>", opts("Close Buffer"))

-- Highlighting
keymap("n", "<leader>h", "<cmd>nohl<cr>", opts("No Highlight"))

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "hj", "<ESC>", opts())
keymap("i", "jh", "<ESC>", opts())

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts())
keymap("v", ">", ">gv^", opts())

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts())
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts())
keymap("v", "p", '"_dP', opts())

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts())
keymap("x", "K", ":m '<-2<CR>gv=gv", opts())
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts())
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts())

-- Telescope --
local builtin = require('telescope.builtin')
keymap('n', '<leader>sF', builtin.find_files, opts("Find File"))
keymap('n', '<leader>sf', builtin.live_grep, opts("Live Grep"))
keymap('n', '<leader>sb', builtin.buffers, opts("Buffer"))
keymap('n', '<leader>sg', builtin.git_files, opts("Git File"))
keymap('n', '<leader>sd', builtin.diagnostics, opts("Diagnostics"))

-- Explorer
keymap('n', '<leader>e', "<cmd>NvimTreeToggle<cr>", opts("Diagnostics"))

-- Alpha
keymap('n', '<leader>a', "<cmd>Alpha<cr>", opts("Alpha"))
