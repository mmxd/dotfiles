" Load vim-plug plugins {{{
call plug#begin('~/.vim/plugged')

"Plug 'brookhong/cscope.vim'
Plug 'chazy/cscope_maps'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'altercation/Vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
" }}}

" Colors {{{
syntax enable
"let g:solarized_termcolors=256
"colorscheme solarized

"colorscheme badwolf
colorscheme desert
" }}}

" Spaces & Tabs {{{
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set smarttab
set expandtab

" Tab navigation like Firefox.
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l> <Esc>:tabnext<CR>i
" }}}

" UI Config {{{
set number
" set showcmd
" set cursorline
filetype indent on
set lazyredraw
set showmatch
" }}}

" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>u :GundoToggle<CR>
" save session
" nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" Searching {{{
set incsearch
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
" space open/closes folds
nnoremap <space> za
set foldmethod=indent
" }}}

" Movement {{{
" }}}

" Tmux {{{
" allows cursor change in tmux mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
" }}}

" Misc {{{
set modeline
set modelines=1

" make Gdiff in vertical mode
set diffopt+=vertical

" make airline plugin font work
let g:airline_powerline_fonts = 1

" make gundo plugin work
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

"" Cscope key-binding
"nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>
"
"" s: Find this C symbol
"nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
"" g: Find this definition
"nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
"" d: Find functions called by this function
"nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
"" c: Find functions calling this function
"nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
"" t: Find this text string
"nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
"" e: Find this egrep pattern
"nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
"" f: Find this file
"nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
"" i: Find files #including this file
"nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" autoloading cscope
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()

"" vimdiff style
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


" vim:foldmethod=marker:foldlevel=0
