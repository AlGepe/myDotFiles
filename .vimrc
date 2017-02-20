""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
"""
"""
""" Vundle + Plugin
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead 
" of Plugin)
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
Plugin 'zanglg/nova.vim'
Plugin 'albertorestifo/github.vim'
Plugin 'airblade/vim-gitgutter' " Git change bar on the right
"Plugin 'easymotion/vim-easymotion' " Check usefulness
Plugin 'python-mode/python-mode' 
Plugin 'dracula/vim'
Plugin 'lervag/vimtex'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" GENERAL OPTIONS
"""
""" 
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Set incremental search by default
set incsearch

" " Display line number on the right by default
set relativenumber

" " Unfold all text when opening
set nofoldenable

" " Set >> & << to indent 4 columns
set shiftwidth=2
highlight BadWhitespace ctermbg=red guibg=red
highlight BadWhitespace ctermbg=red guibg=red

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


set complete +=kspell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" SYNTAX COLORING
"""
""" 
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red 
syntax on


" ColorSchemes
autocmd BufEnter *.java colorscheme moonshine_lowcontrast 
autocmd BufEnter *.cpp source $HOME/.vim/syntax/cpp.vim "colorscheme neodark 
autocmd BufEnter *.c source $HOME/.vim/syntax/c.vim 
autocmd BufEnter *.tex source $HOME/.vim/syntax/tex.vim
autocmd BufEnter *.m colorscheme tcsoft
autocmd BufEnter .vimrc source $HOME/.vim/syntax/vim.vim "colorscheme spring
autocmd BufEnter *.git, *.md colorscheme github
autocmd FileType git* colorscheme github
autocmd FileType gitcommit,mail setlocal spell textwidth=76 colorcolumn=77
autocmd BufEnter *.py,*.pyw source $HOME/.vim/syntax/python.vim "colorscheme molokai

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" EXTRA CONFIG FILE DEPENDANT
"""
""" 
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufRead,BufNewFile *.py 
      "\ set tabstop=4
      "\ set softtabstop=4
      "\ set shiftwidth=4
      "\ set textwidth=79
      "\ set expandtab
      "\ set autoindent 


autocmd BufRead,BufNewFile *.md setlocal spell

" Better Java syntax highlighting
autocmd! FileType java call CSyntaxAfter() 

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.java,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red
"au BufEnter,BufNewFile *.py source .vim/syntax/pep.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" CONFIG FOR PLUGINS
"""
""" 
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better automcomplete python
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> 

" Latex pdf live viewer
let g:livepreview_previewer = 'evince'

" NERDTreee ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
noremap <C-N> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

autocmd! BufWritePost  ~/.vimrc nested :source ~/.vimrc

" Get better folding preview
let g:SimpylFold_docstring_preview=1

" Settings for multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>' "Default==<C-n> changed to avoid interference with NERDTree
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


set term=xterm-256color

