-- Push diagnostics to leftmost of rights side
-- lvim.builtin.lualine.sections.lualine_x =
--   lvim.builtin.lualine.sections.lualine_w
-- Add word count of selection
-- local function selectionCount()
--   local isVisualMode = fn.mode():find("[Vv]")
--   if not isVisualMode then
--     return ""
--   end
--   local starts = fn.line("v")
--   local ends = fn.line(".")
--   local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
--   return "/ "
--     .. tostring(lines)
--     .. "L "
--     .. tostring(fn.wordcount().visual_chars)
--     .. "C"
-- end
-- lvim.builtin.lualine.sections.lualine_x = {
--   "location",
--   { selectionCount },
-- }
--
--
--

lvim.builtin.lualine.sections.lualine_y = {
  "location",
  {
    function()
      local wc = vim.fn.wordcount()
      -- vim function to get number of bytes in the buffer
      -- local bc = vim.fn.line2byte(vim.fn.line("$") + 1) - 2
      if wc["visual_words"] then -- text is selected in visual mode
        return wc["visual_words"] .. ":" .. wc["visual_chars"]
      else -- all of the document
        return wc["words"] .. ":" .. wc["chars"]
      end
    end,
  },
}
-- lvim.builtin.lualine.sections.lualine_y = {
--   components.spaces,
--   components.location,
-- }
