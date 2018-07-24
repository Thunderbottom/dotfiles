" vim config

call plug#begin('~/.vim/plugged')
	Plug 'tommcdo/vim-lion'
	let g:lion_squeeze_spaces = 1
	Plug 'nelstrom/vim-visual-star-search'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	let NERDTreeHijackNetrw = 0
	noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
	noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=
	Plug 'Yggdroot/indentLine'
	let g:indentLine_faster = 1
	let g:indentLine_setConceal = 0
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-syntastic/syntastic'
	Plug 'majutsushi/tagbar'
call plug#end()


function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" hide/show nerdtree
map <C-n> :NERDTreeToggle<CR>
" close vim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number
