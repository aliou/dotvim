require('ad.diagnostic.config')
require('ad.diagnostic.maps')
require('ad.diagnostic.theme')

local augroup = require('ad.diagnostic.status').augroup

-- Expose augroup id so it is easy to delete using `nvim_del_augroup_by_id`.
return {
  augroup = augroup
}
