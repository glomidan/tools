"" Write by glomi

"" Use mouse
set mouse=a

"" LINE
set number "" Display the line number

"" INDENT SETTINGS
set tabstop=4
set shiftwidth=4
set expandtab "" Use space
set autoindent "" Copy the indentation from previous line
set smartindent

"" SYNTAX HIGHLIGHTING
syntax on
colorscheme Atelier_CaveDark
set colorcolumn=80


"" VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
call vundle#end()
filetype plugin indent on

"" LIGHTLINE
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

"" INOREMAP
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0
