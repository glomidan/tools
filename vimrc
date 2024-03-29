"" Write by glomi

"" Use mouse
set mouse=a

"" LINE NUMBER
set number "" Display the line number
highlight LineNr ctermfg=darkgrey "" Set color of line number
set cursorline "" Enable highlithing the line number
highlight clear cursorline "" Hide line number decoration
highlight clear cursorlineNR "" Hide line number decoration

"" INDENT SETTINGS
set tabstop=4
set expandtab "" Use space
set autoindent "" Copy the indentation from previous line
set smartindent

"" SYNTAX HIGHLIGHTING
syntax on
""set colorcolumn=80


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
inoremap {<CR> {<CR>}<left>
inoremap {;<CR> {<CR>};<left>

"" imap cf python
