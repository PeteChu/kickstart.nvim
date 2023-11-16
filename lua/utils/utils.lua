local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.merge_table = function(t1, t2)
  for _, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end

return M
