set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vimwiki/vimwiki'
"Plugin 'tpope/vim-endwise' " Make endings in many languages
"Plugin 'ConradIrwin/vim-bracketed-paste' " Auto set paste
"Plugin 'edsono/vim-matchit' " Broken
"Bundle 'thoughtbot/vim-magictags'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating.git'






" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on


" ColorSchemes
autocmd BufEnter *  colorscheme xterm16
"autocmd BufEnter .vimrc  colorscheme solarized
autocmd BufEnter *.py colorscheme molokai
autocmd BufEnter *.c colorscheme Tomorrow-Night
autocmd Filetype gitcommit,mail setlocal spell textwidth=76 colorcolumn=77



let g:molokai_original = 1

" " Set incremental search by default
set incsearch

" " Display line number on the right by default
set relativenumber

" " Unfold all text when opening
set nofoldenable

" " Set >> & << to indent 4 columns
set shiftwidth=2

" " Set tab to indent 4 columns
set tabstop=2

" " round indent to multiple of 'shiftwidth'
set shiftround

" " align the new line indent with the previous line
set autoindent    

" " set current line absolute number
set number

set laststatus=2

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Get better folding preview
let g:SimpylFold_docstring_preview=1

" get indentation to follow PEP8 standards
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Flagging Unnecessary Whitespace

" Better automcomplete python
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> 

" NERDTreee ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
noremap <C-N> :NERDTreeToggle<CR>

autocmd! BufWritePost  ~/.vimrc nested :source ~/.vimrc

autocmd BufRead,BufNewFile *.md setlocal spell


set complete +=kspell

" Settings for multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>' "Default==<C-n> changed to avoid interference with NERDTree
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

