-- File: qf_delete.lua

local M = {}

-- Delete a single quickfix entry under cursor
function M.delete_current()
  local cur = vim.fn.line(".")
  local list = vim.fn.getqflist()
  if #list == 0 then
    return
  end
  table.remove(list, cur)
  vim.fn.setqflist(list, "r")
  vim.cmd("copen")
  local new_idx = (cur <= #list) and cur or math.max(cur - 1, 1)
  local winid = vim.fn.win_getid()
  vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

-- Delete visually selected range of quickfix entries
function M.delete_range()
  local first = vim.fn.line("v")
  local last = vim.fn.line(".")
  if first > last then
    first, last = last, first
  end
  local list = vim.fn.getqflist()
  for i = last, first, -1 do
    table.remove(list, i)
  end
  vim.fn.setqflist({}, "r", { items = list })
  vim.cmd("copen")
  local winid = vim.fn.win_getid()
  vim.api.nvim_win_set_cursor(winid, { first, 0 })
end

-- Setup function to create buffer-local keymaps for quickfix
function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
      vim.bo.modifiable = true
      vim.keymap.set("n", "dd", M.delete_current, { buffer = true })
      vim.keymap.set("v", "d", M.delete_range, { buffer = true })
    end,
  })
end

return M
