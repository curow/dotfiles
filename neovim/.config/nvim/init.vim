" change the leader key from "\" to ","
let mapleader=","

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" show relative numberlines
set number
set relativenumber

" set indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" create your own text objects without pain
Plug 'kana/vim-textobj-user'
    " reprensent whole textobject using ae or ie
    Plug 'kana/vim-textobj-entire'

" easily delete, change and add surroundings in pairs
Plug 'tpope/vim-surround'

" provide a text-object 'a' (argument)
Plug 'vim-scripts/argtextobj.vim'

" Comment stuff out
Plug 'tpope/vim-commentary'

" add nice statusline at the bottom of each vim window
Plug 'vim-airline/vim-airline'

" nice theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" press one key to jump directly to the target
Plug 'easymotion/vim-easymotion'

" provide CamelCase and under_score motion
Plug 'bkad/camelcasemotion'

" Initialize plugin system
call plug#end()

" set theme as dracula (dracular/vim plugin need to be installed)
colorscheme dracula

" prefix for camelcase motion
let g:camelcasemotion_key = '<leader>'
