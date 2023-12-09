local icons = require("user.icons")

lvim.leader = "space"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["hj"] = "<Esc>"
lvim.keys.insert_mode["jh"] = "<Esc>"


lvim.builtin.which_key.mappings[";"] = { -- toggle spellcheck
  function()
    vim.opt.spell = not vim.opt.spell:get()
  end,
  "Spellcheck",
}

-- Disable cmp completion with tab - important to not interfere with Copilot
lvim.builtin.cmp.mapping["<Tab>"] = nil

-- lsp
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
  icons.cmp_kind.Reference .. " Find References",
}

-- WhichKey mappings for things that start with <leader>
lvim.builtin.which_key.mappings["P"] = {
  "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
  "Projects",
}
lvim.builtin.which_key.mappings["m"] = {
  "<cmd>silent !make<CR>",
  "Make",
}
lvim.builtin.which_key.mappings["t"] = { -- trouble.nvim
  name = "Trouble",
  T = { "<cmd>TodoTrouble<cr>", "Todos" },
  t = { "<cmd>lua require('trouble').open()<cr>", "Trouble" },
  f = {
    "<cmd>lua require('trouble').open('workspace_disagnostics')<cr>",
    "Definitions",
  },
  d = {
    "<cmd>lua require('trouble').open('document_diagnostics')<cr>",
    "Diagnostics",
  },
  q = { "<cmd>lua require('trouble').open('quickfix')<cr>", "QuickFix" },
  l = { "<cmd>lua require('trouble').open('loclist')<cr>", "LocationList" },
  r = { "<cmd>lua require('trouble')('lsp_references').<cr>", "References" },
}
lvim.builtin.which_key.mappings["S"] = { -- persistence.nvim
  name = "Session",
  s = {
    "<cmd>lua require('persistence').load()<cr>",
    "Reload last session for dir",
  },
  d = { "<cmd>lua require('persistence').stop()<cr>", "Stop persistence" },
  l = {
    "<cmd>lua require('persistence').load({ last = true })<cr>",
    "Load last session",
  },
}
lvim.builtin.which_key.mappings["a"] =
{ "<cmd>Alpha<cr>", icons.icons.screen .. "Dasboard" }
lvim.builtin.which_key.mappings["G"] = { "<cmd>Copilot panel<cr>", "Copilot" }
