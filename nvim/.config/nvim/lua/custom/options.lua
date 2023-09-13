local options = {
  shiftwidth = 2,
  tabstop = 2,
  relativenumber = true,
  mouse = "",
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  -- autochdir = true,
  hlsearch = true,
  ignorecase = true,
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 500,
  writebackup = false,
  expandtab = true,
  cursorline = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  linebreak = true,
  scrolloff = 8,
  sidescrolloff = 8,
  whichwrap = "bs<>[]hl",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local g = {
  loaded_newtrw = 1,      -- disable newtrw
  loaded_netrwPlugin = 1, -- disable newtrw
}

for k, v in pairs(g) do
  vim.g[k] = v
end
