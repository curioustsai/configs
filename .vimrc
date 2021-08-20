" "---------------------------------------------------------------------------------------
" "		Apply colorscheme
" "---------------------------------------------------------------------------------------
syntax on
set background=dark
" colorscheme solarized

set guifont=Consolas:h13
" let g:solarized_visibility="high"
" let g:solarized_contrast="high"
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

"---------------------------------------------------------------------------------------
"       Setting - Vim Basic
"---------------------------------------------------------------------------------------
let mapleader=","
set number
set ruler
" set cursorline 
set nowrap
set nocompatible
set backspace=indent,eol,start
set autoindent
set confirm
set history=50
set encoding=utf-8
" set fileencodings=utf-8,big5,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set viminfo+=%

"---------------------------------------------------------------------------------------
"       Setting - Searching
"---------------------------------------------------------------------------------------
set ignorecase
set smartcase
set hlsearch
set incsearch
" set expandtab

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'arcticicestudio/nord-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'rhysd/vim-clang-format'
" Plugin 'vhdirk/vim-cmake'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'instant-markdown/vim-instant-markdown'
" Plugin 'Conque-GDB'
" Plugin 'joonty/vdebug'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'vim-scripts/cscope.vim'
Plugin 'a.vim'
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

"---------------------------------------------------------------------------------------
"       YCM
"---------------------------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
noremap <c-i> :YcmCompleter GoTo<CR>
noremap <c-u>r :YcmCompleter GoToReferences<CR>
noremap <c-u>d :YcmCompleter GoToDefinition<CR>
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_clangd_args = [ '--cross-file-rename' ]

"---------------------------------------------------------------------------------------
"       Ultisnips
"---------------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"---------------------------------------------------------------------------------------
"		Personal Mapping
"---------------------------------------------------------------------------------------"
nmap <leader>w :w<CR>
nmap <leader>q :q!<CR>
nmap <leader>qq :qall!<CR>
nmap <leader>x :wq<CR>
nmap <leader>m :make<CR>
"Switch between .c and .h
nmap <leader>g :A<CR>
nmap <leader>b :BufExplorer<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>l :TagbarToggle<CR> 
"syntastic
nmap <leader>e :call ToggleErrors()<CR>
"T comment
nmap <leader>c <c-_><c-_>
vmap <leader>c <c-_><c-_>
"indent
" nmap <leader>s v>
" nmap <leader>a v<
" vmap <leader>s >gv
" vmap <leader>a <gv

nmap bp :bp<CR>
nmap bn :bn<CR> 
nmap tn :tabNext<CR>
nmap tp :tabprevious<CR>

nmap <F9> :set hls!<BAR>set hls?<CR>
nmap <F10> :set paste!<BAR>set paste?<CR>
nmap <F11> :set nu!<BAR>set nu?<CR>
nmap <F5> :vertical resize +5<CR>
nmap <F6> :vertical resize -5<CR>

"---------------------------------------------------------------------------------------
"       Lazy setting
"---------------------------------------------------------------------------------------" 
" imap ( ()<Left>
" imap [ []<Left>
" imap { {<CR>}<ESC>O
" imap " ""<Left>
"---------------------------------------------------------------------------------------
"       Setting - Window
"---------------------------------------------------------------------------------------" 
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-m> <C-w>_
" nnoremap <C-w> <C-w><C-w>
nnoremap <leader><leader> <C-w><C-w>

"---------------------------------------------------------------------------------------
"       Setting - HEX editor
"---------------------------------------------------------------------------------------
nnoremap <leader>hx  :%!xxd<CR>
nnoremap <leader>rhx :%!xxd -r<CR>

"---------------------------------------------------------------------------------------
"       Setting - Cscope related
"---------------------------------------------------------------------------------------
set csprg =/usr/local/bin/cscope
set cscopequickfix=s0,c0,d0,i0,t-,e0,g0
nnoremap cn :cnext<CR>
nnoremap cp :cprev<CR>
"nnoremap <silent><C-t>  :colder<CR>:cc<CR>
nnoremap <C-t> :pop<CR>

"---------------------------------------------------------------------------------------
"       Setting - Clang related
"---------------------------------------------------------------------------------------
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

let g:clang_format#detect_style_file=1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" autocmd FileType h,c,cpp ClangFormatAutoEnable

"---------------------------------------------------------------------------------------
"       Setting - vim-cmake
"---------------------------------------------------------------------------------------
let g:cmake_ycm_symlinks=1
let g:cmake_export_compile_commands=1
let g:cmake_build_type='Debug'
let g:cmake_project_generator='Ninja'
let g:cmake_build_dir='./build'

packadd termdebug
let g:termdebug_wide=1
