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

lvim.log.level = "info"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
