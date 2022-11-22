-- Keymaps
-- smart paste (indent automatically) but don't comment
vim.keymap.set('n', 'p', 'p=`]')
vim.keymap.set('n', '<c-p>', 'p')
-- autoformat on ctrl k + ctrl d
--map <C-k><C-d> mzgg=G`z<CR>
-- autoformat using vim-autoformat on ctrl k + ctrl d
vim.keymap.set('n', '<C-k><C-d>', ':Autoformat<CR>')
-- Make p in Visual mode replace the selected text with the "" register.
vim.keymap.set('v', 'p', '<Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>')
-- autoindenting for C/C++ like in Emacs
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c,cpp,h,hpp',
    callback = function()
      vim.keymap.set('i', '<Tab>', '<Esc>{=}<C-O><C-O>a')
    end
  })


-- Folding help
vim.keymap.set('n', '<C-m><C-l>', 'zi')
vim.opt.foldmethod = 'syntax'
vim.api.nvim_create_autocmd('Syntax', {
    pattern = 'c,cpp,h,py',
    callback = function()
      command = 'set foldlevelstart=20 | set foldcolumn=5 | set sm! | set cino+=t0,g0,N-s'
    end
  })
--autocmd Syntax c,cpp,h,py let g:clang_use_library=1 | let g:clang_snippets=1 | let g:clang_periodic_quickfix=1
vim.g.c_no_comment_fold = 1

-- Toggle fold state between closed and opened. 
-- If there is no fold at current line, just moves forward. 
-- If it is present, reverse it's state. 
local ToggleFold = function()
  if vim.api.nvim_call_function('foldlevel', {'.'}) ~= 0 then
    if vim.api.nvim_call_function('foldclosed', {'.'}) < 0 then
      vim.api.nvim_command('. foldclose')
    else
      vim.api.nvim_command('. foldopen')
    end
  end
  -- Clear status line 
  vim.api.nvim_command('echo')
end

-- Map this function to Space key. 
vim.keymap.set({'v', 'n'}, '<space>', ToggleFold)

-- Auto completion via ctrl-space instead of ctrl+x ctrl+u
vim.keymap.set('i', '<C-space>', '<C-x><C-u>')

-- Go to symbol / go back to previous position
vim.keymap.set({'n','v','i'}, '<F7>', ':YcmCompleter GoTo<CR>')
vim.keymap.set({'n','v','i'}, '<S-F7>', '<C-T>')
vim.keymap.set({'n','v','i'}, '<F8>', 'ntext<CR>')
vim.keymap.set({'n','v','i'}, '<C-F8>', 'nprev<CR>')

vim.keymap.set({'n','v','i'}, '<C-H>', 'gT')
vim.keymap.set({'n','v','i'}, '<C-L>', 'gt')
vim.keymap.set({'n','v','i'}, '<C-J>', '<C-W>j')
vim.keymap.set({'n','v','i'}, '<C-K>', '<C-W>k')
vim.keymap.set({'n'}, '<F12>', ':let zenburn_high_Contrast = ( zenburn_high_Contrast == 1 ? 0 : 1 )<CR>:color zenburn<CR>')
