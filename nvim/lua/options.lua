vim.opt.clipboard:append('unnamedplus') -- Allow nvim to use system clipboard
vim.opt.autochdir = true		-- Use existing tab/buffer is file is opened in one
vim.opt.switchbuf = 'usetab'	-- Use existing tab/buffer is file is opened in one

-- Indent stuff
vim.opt.ai = true				-- always set autoindenting on
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
--
vim.opt.splitright = true		-- open new vsplits to the right
vim.opt.splitbelow = true		-- open new splits below
vim.opt.stal = 2				-- always show tabline
vim.opt.bs = { 'indent', 'eol', 'start' }	-- allow backspacing over everything in insert mode
vim.opt.history = 50		    -- keep 50 lines of command line history
vim.opt.ruler = true        	-- show the cursor position all the time
vim.opt.number = true
vim.opt.wrap = false
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true		-- Only ignore case if search has no uppercase letter
vim.opt.incsearch = true		-- Always highlight search matches
vim.opt.hlsearch = true			-- Always highlight search matches
-- Colors and theme
vim.cmd('syntax on')
vim.opt.termguicolors = true
vim.opt.guifont = 'Hack:h8'
vim.cmd('let zenburn_high_Contrast=0')
vim.cmd.colorscheme('zenburn')

-- Grep
vim.opt.grepprg = 'rg --vimgrep --follow --line-number --with-filename'

-- Meson
vim.g.meson_space_error_highlight = 1

-- Format the statusline and always show it - Replaced by airline
--vim.opt.statusline = '%F%m%r%h%w\\ [FORMAT=%{&ff}]\\ [TYPE=%Y]\\ [ASCII=\\%03.3b]\\ [HEX=\\%02.2B]\\ [POS=%04l,%04v][%p%%]\\ [LEN=%L]'
--vim.opt.laststatus = 2

