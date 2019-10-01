""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
"""
"""
""" Vundle + Plug
"""
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" set the runtime path to initialize vimplug
call plug#begin()

Plug 'tmhedberg/SimpylFold' " Folding code paragraphs
Plug 'vim-scripts/indentpython.vim', {'for': 'python'} " PEP 8
" Plug 'Valloric/YouCompleteMe', {'for': 'c'} " Autocompletion for C-like languages and more
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Folder navigator on Ctrl+N
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' } " This plugin aims at making NERDTree feel like a true panel, independent of tabs.
" Plug 'kien/ctrlp.vim' "Mega incr-searcher syswide almighty (I always forget)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' " Gcommit and similar commands withing vim, sugoi!
Plug 'terryma/vim-multiple-cursors' " self-explanatory might be useless 
" Reason https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db 
Plug 'vimwiki/vimwiki', {'for':'wiki'} "Awesome personal notebook
"Plug 'tpope/vim-endwise' " Make endings  for structures in many languages
"Plug 'ConradIrwin/vim-bracketed-paste' " Auto set paste
Plug 'altercation/vim-colors-solarized' "Colorscheme
Plug 'tpope/vim-speeddating.git' " Ctrl+A/X also changes dates properly
Plug 'zanglg/nova.vim' "colorscheme
Plug 'albertorestifo/github.vim' "colorscheme
Plug 'airblade/vim-gitgutter' " Git change bar on the Left
Plug 'easymotion/vim-easymotion' " Check usefulness visual movements
Plug 'python-mode/python-mode' " Proper IDE tools (run, break-p...)
Plug 'dracula/vim' " Colorscheme
Plug 'lervag/vimtex' " Colorscheme
Plug 'flazz/vim-colorschemes' " Colorscheme
Plug 'thaerkh/vim-indentguides' "Indent guides


" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""                        GLOBAL NVIM OPTIONS
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch
" Set global number for current line and relative for the rest
set relativenumber number

" " Unfold all text when opening
set nofoldenable

" " Set tab, >> & << to indent 4 columns as spaces
set tabstop=4 shiftwidth=4 expandtab
highlight BadWhitespace ctermbg=red guibg=red
highlight BadWhitespace ctermbg=red guibg=red

" " round indent to multiple of 'shiftwidth'
set shiftround

" " align the new line indent with the previous line
set autoindent

" Set status bar to see all infos (useful with powerline)
set laststatus=2

" Set spell-checker language to EN-UK
set spelllang=en_gb

" split navigations (Navigate between splits is Ctrl+normal nav)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

set complete +=kspell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
"""                      SYNTAX COLORING
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red 
syntax on


" ColorSchemes
autocmd BufEnter *.java colorscheme moonshine_lowcontrast
autocmd BufEnter *.cpp source $VIMRUNTIME/syntax/cpp.vim "colorscheme neodark
autocmd BufEnter *.c source $VIMRUNTIME/syntax/c.vim
autocmd BufEnter *.tex source $VIMRUNTIME/syntax/tex.vim
autocmd BufEnter *.m colorscheme tcsoft
autocmd BufEnter *.wiki source $VIMRUNTIME/syntax/wiki.vim
autocmd BufEnter init.vim source $VIMRUNTIME/syntax/vim.vim "colorscheme spring
autocmd BufEnter *.git, *.md colorscheme github
autocmd FileType git* colorscheme github
autocmd FileType gitcommit,mail setlocal spell textwidth=76 colorcolumn=77
autocmd BufEnter *.py,*.pyw source $VIMRUNTIME/syntax/python.vim "colorscheme molokai

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
"""                    EXTRA CONFIG FILE DEPENDANT
"""
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
"""
"""                    CONFIG FOR PLUGINS
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FZF +ripgrep
let $FZF_DEFAULT_COMMAND='rg --files'
" Enable folding on vimwiki
let g:vimwiki_folding='list'

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

" Configs
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'


"set term=xterm-256color

" Custom command for right encryption options (no compatible)
":command EncryptionMode set cm=blowfish2|set viminfo=|set nobackup|set nowritebackup
