require('ad.globals')

require('ad.diagnostic')
require('ad.git')
require('ad.lsp')
require('ad.maps')
require('ad.search')
require('ad.search-prev')
require('ad.telescope')
require('ad.ui')
require('ad.navigation')

require('ad.test')

-- Load theme last to make sure all callbacks are registered.
require('ad.theme')
