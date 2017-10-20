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
Plugin 'Valloric/YouCompleteMe' " Autocompletion for C-like languages and more
Plugin 'scrooloose/syntastic' "Syntax checking for multiple Languages (gotta learn more)
" Flake8 becomes redundant w/ syntastic
"Plugin 'nvie/vim-flake8' "syntax and style checker for python pep8+pyflakes
Plugin 'scrooloose/nerdtree' "Folder navigator on Ctrl+N
Plugin 'jistr/vim-nerdtree-tabs' " This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plugin 'kien/ctrlp.vim' "Mega incr-searcher syswide almighty (I always forget)
Plugin 'tpope/vim-fugitive' " Gcommit and similar commands withing vim, sugoi!
Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'} "cool bottombar
Plugin 'terryma/vim-multiple-cursors' " self-explanatory might be useless 
" Reason https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db 
Plugin 'vimwiki/vimwiki' "Awesome personal notebook
"Plugin 'tpope/vim-endwise' " Make endings  for structures in many languages
"Plugin 'ConradIrwin/vim-bracketed-paste' " Auto set paste
"Plugin 'edsono/vim-matchit' " Broken
"Bundle 'thoughtbot/vim-magictags' Autocreate ctags for git projects (has "problems)
Plugin 'altercation/vim-colors-solarized' "Colorscheme
"Plugin 'tpope/vim-surround' " To change surrounders (quotes, brakets...) fast
Plugin 'tpope/vim-speeddating.git' " Ctrl+A/X also changes dates properly
Plugin 'zanglg/nova.vim' "colorscheme
Plugin 'albertorestifo/github.vim' "colorscheme
Plugin 'airblade/vim-gitgutter' " Git change bar on the Left
Plugin 'easymotion/vim-easymotion' " Check usefulness visual movements
Plugin 'python-mode/python-mode' " Proper IDE tools (run, break-p...)
Plugin 'dracula/vim' " Colorscheme
Plugin 'lervag/vimtex' " Colorscheme
Plugin 'flazz/vim-colorschemes' " Colorscheme


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

" " Display line number on the left by default
set relativenumber

" " set current line absolute number
set number

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

" Set status bar to see all infos (useful with powerline)
set laststatus=2

" split navigations (Navigate between splits is Ctrl+normal nav)
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

" Re-source .vimrc after saving vimrc
autocmd! BufWritePost  ~/.vimrc nested :source ~/.vimrc

" Get better folding preview
let g:SimpylFold_docstring_preview=1

" Settings for multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>' 
"Default==<C-n> changed to avoid interference with NERDTree
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


set term=xterm-256color

" Custom command for right encryption options (no compatible)
:command EncryptionMode set cm=blowfish2|set viminfo=|set nobackup|set nowritebackup
