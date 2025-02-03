let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
Plug 'sirver/ultisnips'
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
call plug#end()

syntax on
filetype on
set number
set cursorcolumn
set t_Co=256
set foldmethod=indent
set foldlevel=99
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set background=dark

nnoremap <space> za
au BufNewFile, BufRead *.py
	\ set tabstop =4
	\ set softtabstop =4
	\ set shiftwidth =4
	\ set textwidth =79
	\ set expandtab
	\ set autoindent
	\ set fileformat =unix

let g:ale_linters = {'python': ['flake8']}
" VimTex Stuff"

nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>

filetype plugin indent on
syntax enable
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_complier_method = 'latexrun'
let maplocalleader = ","
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]

autocmd vimenter * ++nested colorscheme gruvbox
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
