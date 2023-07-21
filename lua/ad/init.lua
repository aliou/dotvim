require('ad.globals')

require('ad.diagnostic')
require('ad.format')
require('ad.git')
require('ad.lsp')
require('ad.maps')
require('ad.search')
require('ad.telescope')
require('ad.ui')

-- Load theme last to make sure all callbacks are registered.
require('ad.theme')
