local watcher = require('ad.theme.watcher')

-- Set default configuration. There's a good chance this is overriden on a per computer
-- basis in ~/.vimrc.local.
vim.g.colors = { light = 'github_light_default', dark = 'github_dark_default' }

watcher.run()
