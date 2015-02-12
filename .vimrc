set nocompatible

" To be set before plugins are loaded
"let mapleader=","

" Vundle stuff
filetype off       " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" My Plugins here
" original repos on github
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
" Plugin 'xolox/vim-easytags'
" Plugin 'xolox/vim-misc'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'The-NERD-Commenter'
Plugin 'tikhomirov/vim-glsl'
Plugin 'clang-complete'

" Color schemes
Plugin 'jnurmine/Zenburn'
" Required by Vundle
call vundle#end()

" Easytags settings
set tags=./.tags;
let g:easytags_dynamic_files=2 " Always create a local tags file
let g:easytags_python_enabled=1

" clang_complete settings
let clang_library_path="/usr/lib64/"

" Rest of file
filetype plugin indent on
syntax on
set autochdir

set noet
set shiftwidth=4
set softtabstop=4
set tabstop=4

set stal=2              " always show tabline
set bs=2                " allow backspacing over everything in insert mode
set ignorecase
set ai		        	" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than 50 lines of registers
set history=50		    " keep 50 lines of command line history
set ruler	        	" show the cursor position all the time
set number

set nowrap
set incsearch hlsearch
filetype indent plugin on

" smart paste (indent automatically) but don't comment
nnoremap p p=`]
nnoremap <c-p> p
" autoformat on ctrl k + ctrl d
map <C-k><C-d> mzgg=G`z<CR>

let zenburn_high_Contrast=0
" 256 color Vim
set t_Co=256
colo zenburn
set grepprg=grep\ -nH\ $*
set guifont=Anonymous\ Pro\ 8

"Remove tearoff menus
let &guioptions = substitute(&guioptions, "t", "", "g")

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Don't use Ex mode, use Q for formatting
map Q gq

if has ("guirunning")
	set columns=425
	" interactive shell for gvim
	set shellcmdflag=-ic
endif

" subgroup by first char
let g:TagsMenu_subgroupByFirstChar = 1

" C/C++ stuff
" autoindenting for C/C++/Perl,java,html,xml,php like in Emacs
autocmd FileType c,cpp,perl,java,html,xml,php :inoremap <Tab> <Esc>{=}<C-O><C-O>a

" Haskell stuff
au BufEnter *.hs compiler ghc
autocmd FileType haskell :setlocal formatoptions+=t
let b:ghc_staticoptions = '-Wall -Werror'
let g:haddock_browser="/usr/bin/firefox"

" folding help
set foldmethod=syntax
autocmd FileType cpp,h set omnifunc=omni#cpp#complete#Main
autocmd FileType c,cpp,java,h set foldlevel=5 | set foldcolumn=3 | set sm!
autocmd FileType c,cpp,h let b:easytags_auto_highlight = 0 | let g:clang_use_library=1 | let g:clang_snippets=1 | let g:clang_periodic_quickfix=1
let c_no_comment_fold=1

" Toggle fold state between closed and opened. 
" 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
	if foldlevel('.') != 0 
		if foldclosed('.') < 0 
			. foldclose 
		else 
			. foldopen 
		endif 
	endif 
	" Clear status line 
	echo 
endfun 

" Map this function to Space key. 
noremap <space> :call ToggleFold()<CR> 

" Format the statusline and always show it
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]   
set laststatus=2

" Auto completion via ctrl-space instead of ctrl+x ctrl+u
inoremap <C-space> <C-x><C-u>

" Map for updating clang_complete error list
nmap <leader>u <silent>:call g:ClangUpdateQuickFix()<CR>

" Find references, go to declarations, find subclasses (depends on vim plugin
" clang_indexer
"nnoremap <Leader>r :call ClangGetReferences()<CR>
"nnoremap <Leader>d :call ClangGetDeclarations()<CR>
"nnoremap <Leader>s :call ClangGetSubclasses()<CR>

" Go to symbol / go back to previous position
nmap <F7> <C-]>
nmap <S-F7> <C-T>
nmap <A-F7> :ptselect<CR>
nmap <F8> :tnext<CR>
nmap <C-F8> :tprev<CR>

map <C-H> gT
map <C-L> gt
map <C-J> <C-W>j
map <C-K> <C-W>k
map <F12> :let zenburn_high_Contrast = ( zenburn_high_Contrast == 1 ? 0 : 1 )<CR>:color zenburn<CR>
