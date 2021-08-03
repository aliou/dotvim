-- TODO: Use the table in the __index and __newindex so we can inspect the
-- vim.registers variable.
local register_mt = {
  __index = function(_, register_name)
    return vim.fn.getreg(register_name)
  end,

  __newindex = function(_, register_name, value)
    if value == nil then value = {} end
    vim.fn.setreg(register_name, value)
  end,
}

vim.registers = setmetatable({}, register_mt)
