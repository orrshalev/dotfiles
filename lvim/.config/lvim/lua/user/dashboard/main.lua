local icons = require("user.icons")

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "custom"

local header = {
  type = "text",
  val = require("user.dashboard.banners").dashboard(),
  opts = {
    position = "center",
    hl = "Comment",
  },
}

local date = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
  local thingy =
    io.popen("echo \"$(date +%a) $(date +%d) $(date +%b)\" | tr -d \"\n\"")
  date = thingy:read("*a")
  thingy:close()
else
  date = "  whatever "
end

local heading = {
  type = "text",
  val = "┌─ " .. icons.icons.calendar .. " Today is " .. date .. " ─┐",
  opts = {
    position = "center",
    hl = "String",
  },
}

local fortune = require("alpha.fortune")()
-- fortune = fortune:gsub("^%s+", ""):gsub("%s+$", "")
local footer = {
  type = "text",
  val = fortune,
  opts = {
    position = "center",
    hl = "Comment",
    hl_shortcut = "Comment",
  },
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 24,
    align_shortcut = "right",
    hl_shortcut = "Number",
    hl = "Function",
  }
  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button(
      "f",
      " " .. icons.cmp_kind.Folder .. " Explore",
      ":Telescope find_files<CR>"
    ),
    button(
      "e",
      " " .. icons.cmp_kind.File .. " New file",
      ":ene <BAR> startinsert <CR>"
    ),
    button(
      "p",
      " " .. icons.cmp_kind.Module .. " Projects",
      ":lua require'telescope'.extensions.project.project{}<cr>"
    ),
    button(
      "s",
      " " .. icons.icons.magic .. " Last Session",
      ":lua require('persistence').load({last = true})<cr>"
    ),
    button(
      "g",
      " " .. icons.icons.git .. " Git Status",
      ":lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>"
    ),
    button(
      "r",
      " " .. icons.icons.clock .. " Recents",
      ":Telescope oldfiles<CR>"
    ),
    button(
      "c",
      " " .. icons.icons.settings .. " Config",
      ":e ~/.config/lvim/config.lua<CR>"
    ),
    button("q", " " .. icons.icons.exit .. " Quit", ":q<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  header = header,
  buttons = buttons,
  heading = heading,
  footer = footer,
}

lvim.builtin.alpha.custom = {
  config = {
    layout = {
      { type = "padding", val = 1 },
      section.header,
      { type = "padding", val = 2 },
      section.heading,
      section.plugin_count,
      { type = "padding", val = 1 },
      section.buttons,
      section.footer,
    },
    opts = {
      margin = 5,
    },
  },
}
