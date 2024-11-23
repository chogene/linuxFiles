let myvar = "my vimrc loaded"

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
call plug#end()


syntax on
filetype on
set number
set cursorcolumn


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
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
"let g:UltiSnipsSnippetDirectories = ["UltiSnips"]"


