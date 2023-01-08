"---------------------------------------------------------------------------------------
"		Personal Mapping
"---------------------------------------------------------------------------------------"
set ignorecase
set smartcase
set hlsearch
set incsearch

let mapleader="<Space>"
nmap <leader>w :w<CR>
nmap <leader>q :q!<CR>
nmap <leader>qq :qall!<CR>
nmap <leader>x :wq<CR>
nmap <leader>b :BufExplorer<CR>
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>l :TagbarToggle<CR> 
"T comment
nmap <leader>c <c-_><c-_>
vmap <leader>c <c-_><c-_>

nmap bp :bp<CR>
nmap bn :bn<CR> 
