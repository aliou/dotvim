local prev_notify = vim.notify

-- TODO: Ignore some messages, e.g. the "no code action available"
return function(message, level, options)
  prev_notify(message, level, options)
end
