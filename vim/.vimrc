colorscheme oceannext
syntax on
set number
call plug#begin('~/.vim/plugged')

	"vim-lion: https://github.com/tommcdo/vim-lion
	Plug 'tommcdo/vim-lion'
	let g:lion_squeeze_spaces = 1

	"vim-visual-star: https://github.com/nelstrom/vim-visual-star-search
	Plug 'nelstrom/vim-visual-star-search'

	"NERDTree: https://github.com/scrooloose/nerdtree
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	let NERDTreeHijackNetrw = 0
	noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
	noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=

	"vim-indent-line: https://github.com/Yggdroot/indentLine
	Plug 'Yggdroot/indentLine'
	let g:indentLine_faster = 1
	let g:indentLine_setConceal = 0

	"vim-surround: https://github.com/tpope/vim-surround
	Plug 'tpope/vim-surround'

	"vim-fugitive: https://github.com/tpope/vim-fugitive
	Plug 'tpope/vim-fugitive'

	"vim-syntastic: https://github.com/vim-syntastic/syntastic
	Plug 'vim-syntastic/syntastic'

	"tagbar: https://github.com/majutsushi/tagbar
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
