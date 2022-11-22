-- To be set before plugins are loaded
vim.g.mapleader = ','

-- Own config/setup files
require('plugins')
require('options')
require('keymaps')
require('statusbar')
require('diffviewconf')
require('cmpconfig')
require('lspconfigconf')

-- Init plugins
--require('chadtree').setup()
