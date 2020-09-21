" change the leader key from "\" to ","
let mapleader=","

" enable mouse in insert mode
set mouse=a

" show numberlines
set number

" highlight the line and column on which cursor is
" set cursorline
" set cursorcolumn

" set indentation
set tabstop=4
set shiftwidth=4
set expandtab

" make input # less irratating
inoremap # X#<left><backspace><right>

" Copy to clipboard
vnoremap  <Leader>y  "+y
nnoremap  <Leader>Y  "+yg_
nnoremap  <Leader>y  "+y
nnoremap  <Leader>yy  "+yy

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" toggle hlsearch using <Leader>h
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" use gui color
set termguicolors

" jump between files without save changes
set hidden

" edit vimrc using <Leade>v
nnoremap <Leader>v :e $MYVIMRC<cr>

" edit zshrc using <Leader>z
nnoremap <Leader>z :e ~/.zshrc<cr>

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
" Plug 'skywind3000/vim-dict'
Plug 'asins/vim-dict'

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

" just for mac, automatically switch to english when in normal
Plug 'ybian/smartim'

" asyncrun shell command
Plug 'skywind3000/asyncrun.vim'

" " snippet engine
" Plug 'SirVer/ultisnips'

" " comman snippets
" Plug 'honza/vim-snippets'

" vim for matlab
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }

" Initialize plugin system
call plug#end()

" set theme as dracula (dracular/vim plugin need to be installed)
colorscheme dracula

"camelcase motion trigger
let g:camelcasemotion_key = '<Leader><Leader>'


" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'*': 1}

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 0 

" dictionary path
set dictionary+=/usr/share/dict/words

" source for dictionary, current or other loaded buffers, see ':help cpt'
set complete=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

" config tablines
nmap <Leader>1 <Plug>BuffetSwitch(1)
nmap <Leader>2 <Plug>BuffetSwitch(2)
nmap <Leader>3 <Plug>BuffetSwitch(3)
nmap <Leader>4 <Plug>BuffetSwitch(4)
nmap <Leader>5 <Plug>BuffetSwitch(5)
nmap <Leader>6 <Plug>BuffetSwitch(6)
nmap <Leader>7 <Plug>BuffetSwitch(7)
nmap <Leader>8 <Plug>BuffetSwitch(8)
nmap <Leader>9 <Plug>BuffetSwitch(9)
nmap <Leader>0 <Plug>BuffetSwitch(10)
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <Leader>d :bd<CR>

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
nmap <Leader>f <Plug>(easymotion-overwin-f2)
" enhance t in operator mode
omap <Leader>t <Plug>(easymotion-bd-tl)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" source current file using <C-s>
noremap <Leader>so :source%<CR>

" save current file
nnoremap <Leader>w :w<CR>

" change word under cursor to uppercase, works in insert mode
noremap! <C-F> <Esc>gUiw`]a

" change words to uppercase, works in normal mode
nnoremap <Leader>U <Esc>gUiw

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" see https://www.systutorials.com/how-to-make-vim-indent-c11-lambdas-correctly/
" Try to fix vim crazy indentation inside lambda function of c++
setlocal cindent
setlocal cino=j1,(0,ws,Ws

" file type recognition and sytax highlight
filetype plugin indent on
syntax on

" c++ support for competitive programming
nnoremap <silent> <Leader>c :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0
    \ g++-10 -std=c++17 -O3 -Wall -DDEBUG -DTIMING %; ./a.out; cat output.txt <CR>
nnoremap <silent> <Leader>r :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0
    \ ./a.out; cat output.txt <CR>

" vim-matlab settings
let g:matlab_auto_mappings = 0 "automatic mappings disabled
let g:matlab_server_launcher = 'vim'  "launch the server in a Neovim terminal buffer
let g:matlab_server_split = 'horizontal'   "launch the server in a vertical split
nnoremap <buffer><silent> <Leader><Leader>m :MatlabLaunchServer<CR>
nnoremap <buffer><silent> <Leader><Leader>r :MatlabCliRunCell<CR>
nnoremap <buffer><silent> <CR> :MatlabCliRunCell<CR>
nnoremap <buffer><silent> <Leader><Leader>s :MatlabCliRunSelection<CR>
nnoremap <buffer><silent> <Leader><Leader>c :MatlabCliCancel<CR>
nnoremap <buffer><silent> <Leader><Leader>e :MatlabCliOpenInMatlabEditor<CR>
nnoremap <buffer><silent> <Leader><Leader>h :MatlabCliHelp<CR>
nnoremap <buffer><silent> <Leader><Leader>l :MatlabNormalModeCreateCell<CR>
vnoremap <buffer><silent> <Leader><Leader>l :<C-u>MatlabVisualModeCreateCell<CR>
inoremap <buffer><silent> <Leader><Leader>l <C-o>:MatlabInsertModeCreateCell<CR>
nnoremap <buffer><silent> <Leader><Leader>i <ESC>:MatlabCliViewVarUnderCursor<CR>
vnoremap <buffer><silent> <Leader><Leader>i <ESC>:MatlabCliViewSelectedVar<CR>

" return normal mode from terminal mode using <Esc>
tnoremap <Esc> <C-\><C-n>

" quit all
nnoremap <Leader>q :qa<CR>

" new horizaontal splits are on the bottom
set splitbelow
