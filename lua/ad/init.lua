require('ad.globals')

require('ad.git')
require('ad.lsp')
require('ad.telescope')
require('ad.visual_search')

-- Load theme last to make sure all callbacks are registered.
require('ad.theme')
