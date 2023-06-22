local watcher = require('ad.theme.watcher')

-- Set default configuration. There's a good chance this is overriden on a per computer
-- basis in ~/.vimrc.local.
vim.g.colors = { dark = 'github_dark_dimmed', light = 'github_light' }

watcher.run()
