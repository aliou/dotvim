local debug = function(msg)
  vim.notify(msg, vim.log.levels.DEBUG, { prefix = "ad.format" })
end

-- To not have the formatting update be too jarring, save and restore the view
-- of the current window around the application of the formatting.
local pre_format = function()
  debug("Running pre format callback")
  vim.b.formatter_view = vim.fn.winsaveview()
end

local post_format = function()
  debug("Running post format callback")
  if not vim.b.formatter_view then return end

  vim.fn.winrestview(vim.b.formatter_view)
  vim.b.formatter_view = nil

  -- Write changes witout triggering autocommands.
  vim.cmd("noautocmd :update")
end

local setup = function(augroup)
  vim.api.nvim_create_autocmd('User', {
    group = augroup, pattern = "FormatterPre", callback = pre_format,
    desc = '[format] pre_format'
  })

  vim.api.nvim_create_autocmd('User', {
    group = augroup, pattern = "FormatterPost", callback = post_format,
    desc = '[format] post_format'
  })
end

return {
  setup = setup
}
