syntax on
set relativenumber      " Show relative line numbers
set tabstop=2           " Number of spaces per tab
set shiftwidth=2        " Indentation width
set expandtab           " Use spaces instead of tabs
set autoindent          " Auto-indent new lines
set wrap                " Wrap long lines
set ignorecase          " Ignore case in searches
set smartcase           " Case-sensitive if uppercase is used
set incsearch           " Incremental search
set hlsearch            " Highlight search results
set clipboard=unnamedplus " Use system clipboard
set scrolloff=8         " Keep 8 lines above/below cursor
set noswapfile

nnoremap gd gd:noh<CR>
inoremap <C-h> <C-w>
nnoremap gD gD:noh<CR>
colorscheme industry

