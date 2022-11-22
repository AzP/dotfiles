-- Airline
vim.g.airline_powerline_fonts = 1
if (not(vim.g.airline_symbols)) then
	vim.cmd('let g:airline_symbols = {}')
end
--vim.g.airline_symbols['space']:append('\\ua0') -- Can't get this to work currently
vim.cmd('let g:airline_symbols.space = \"\\ua0\"')
