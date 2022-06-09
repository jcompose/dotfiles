call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim' 
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Configure so the lightline shows up with 1 window
set laststatus=2
let g:lightline = {
   \ 'colorscheme': 'gruvbox'
   \ }

" Various settings I like to have on
colorscheme gruvbox-material
syntax on
set tabstop=4
set shiftwidth=4
set number relativenumber
set cursorline

" Add configuration stuff for coc
so /home/jackson/.cocrc.vimrc
