local current_buf_has_filetype = require('cstm.util').current_buf_has_filetype
local completion = require('completion')

local on_attach = function()
  local trigger_keyword_length = 1

  if current_buf_has_filetype('ruby') then
    trigger_keyword_length = 3
  end

  completion.on_attach({
    trigger_keyword_length = trigger_keyword_length
  })
end

return {
  on_attach = on_attach
}
