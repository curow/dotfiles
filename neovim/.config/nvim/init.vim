" change the leader key from "\" to ","
let mapleader=","

" file type recognition
filetype on
filetype plugin on
filetype indent on

" enable mouse in insert mode
set mouse=a

" syntax highlighting
syntax on

" show numberlines
set number

" highlight the line and column on which cursor is
set cursorline
set cursorcolumn

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

" toggle hlsearch using <leader>h
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" use gui color
set termguicolors

" jump between files without save changes
set hidden

" edit vimrc using <Leade>v
nnoremap <Leader>v :e $MYVIMRC<cr>

" netrw config
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" use git inside vim
Plug 'tpope/vim-fugitive'

" show complete menu automatically
Plug 'skywind3000/vim-auto-popmenu'

" dictionary database plugin for many languages
Plug 'skywind3000/vim-dict'

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

" provide rainbow parentheses
Plug 'luochen1990/rainbow'

" provide icons for files
Plug 'ryanoasis/vim-devicons'

" provide tabline at the top
function! g:BuffetSetCustomColors() " set color for vim-buffet
    highlight! BuffetCurrentBuffer guibg=#282a36 guifg=#bd93f9
    highlight! BuffetBuffer guibg=#282a36 guifg=#f8f8f2
    highlight! BuffetTab guibg=#282a36 guifg=#f8f8f2
endfunction
Plug 'bagrat/vim-buffet'

" use - to go to the upper dir
Plug 'tpope/vim-vinegar'

" Initialize plugin system
call plug#end()

" set theme as dracula (dracular/vim plugin need to be installed)
colorscheme dracula

"camelcase motion trigger
let g:camelcasemotion_key = '<leader>'


" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'*': 1}

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 

" source for dictionary, current or other loaded buffers, see ':help cpt'
set complete=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

" config tablines
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 0
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" easy motion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just two key binding.
" `s{char}{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" enhance t in operator mode
omap <Leader>t <Plug>(easymotion-bd-tl)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" source current file using <C-s>
noremap <C-S> :source%<CR>

" save current file
nnoremap <Leader><Leader> :w<CR>

" change word before cursor to uppercase
noremap <C-F> <Esc>gUiw`]a

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" If a file is changed outside of vim, automatically reload it without asking
set autoread
