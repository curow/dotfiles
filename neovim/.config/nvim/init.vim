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

" give more space for displaying messages
set cmdheight=2

" having longer updatetime (default is 4000 ms = 4 s) leads
" to noticeable delays and poor user experience.
set updatetime=300

" don't pass messages to |ins-completion-menu|
set shortmess+=c

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

" enable auto popmenu for filetypes, '*' for all files.
let g:apc_enable_ft = {'*': 1}
let g:apc_min_length = 3

" dictionary path
" set dictionary+=/usr/share/dict/words

" source for dictionary, current or other loaded buffers, see ':help cpt'
set complete=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" dictionary database plugin for many languages
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

" provide CamelCase and under_score motion
Plug 'bkad/camelcasemotion'

"camelcase motion trigger
let g:camelcasemotion_key = '<Leader>'

" provide icons for files
Plug 'ryanoasis/vim-devicons'

" provide tabline at the top, this function must be
" defined before vim-buffet plugin
function! g:BuffetSetCustomColors() " set color for vim-buffet
    highlight! BuffetCurrentBuffer guibg=#282a36 guifg=#bd93f9
    highlight! BuffetBuffer guibg=#282a36 guifg=#f8f8f2
    highlight! BuffetTab guibg=#282a36 guifg=#f8f8f2
endfunction
Plug 'bagrat/vim-buffet'

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
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 0
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" use - to go to the upper dir
Plug 'tpope/vim-vinegar'

" asyncrun shell command
Plug 'skywind3000/asyncrun.vim'

" c++ additional syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" cpp highlight setup
let c_no_curly_error=1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" c++ clang format
Plug 'rhysd/vim-clang-format'

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,cc,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,cc,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" code auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" get terminal easily
Plug 'vimlab/split-term.vim'
noremap <Leader>t :Term<CR>

" Initialize plugin system
call plug#end()

" set theme as dracula (dracular/vim plugin need to be installed)
colorscheme dracula

" file type recognition and sytax highlight
filetype plugin indent on
syntax on

" source current file using <C-s>
noremap <Leader>so :source%<CR>

" save current file
nnoremap <Leader><Leader> :w<CR>

" change word under cursor to uppercase, works in insert mode
noremap! <C-F> <Esc>gUiw`]a

" change words to uppercase, works in normal mode
nnoremap <Leader>U <Esc>gUiw

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" c++ support for competitive programming
" see https://usaco-guide.netlify.app/intro/running-code
" to see why & fg is needed, in short, it makes mac display
" program crash messages
nnoremap <silent> <Leader>c :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0
    \ g++-10 -std=c++17 -O2 -Wall -DDEBUG -DTIMING % && ./a.out && cat output.txt <CR>
nnoremap <silent> <Leader>r :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0
    \ ./a.out && cat output.txt <CR>

" c++ for modern c++ course set up
nnoremap <silent> <Leader>sc :AsyncRun -mode=term -pos=bottom -rows=10 -focus=0
    \ clang++ -std=c++17 -O2 % && ./a.out <CR>

" goto header, works in mac
set path+=/usr/local/include/c++/10.2.0/
nnoremap <expr> gh expand('<cWORD>') == '#include' ? 'Wgf' : 'gf'

" return normal mode from terminal mode using <Esc>
tnoremap <Esc> <C-\><C-n>

" quit all
nnoremap <Leader>q :qa<CR>

" new horizaontal splits are on the bottom
set splitbelow

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" see https://www.systutorials.com/how-to-make-vim-indent-c11-lambdas-correctly/
" Try to fix vim crazy indentation inside lambda function of c++
setlocal cindent
setlocal cino=j1,(0,ws,Ws
