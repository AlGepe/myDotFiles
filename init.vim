"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Folder navigator on Ctrl+N
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' } " This plugin aims at making NERDTree feel like a true panel, independent of tabs.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-tex-fold'
Plug 'Konfekt/FastFold'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-fugitive' " Gcommit and similar commands withing vim, sugoi!
"Plug 'terryma/vim-multiple-cursors' " self-explanatory might be useless 
" Reason https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db 
Plug 'vimwiki/vimwiki', {'for':'wiki'} "Awesome personal notebook
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
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" nOTE: you need to install completion sources to get completions. Check our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-jedi'
Plug 'wellle/tmux-complete.vim'
" Snipet integration
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
"Plug 'junegunn/limelight.vim' " To be explored
"Plug 'lifepillar/vim-mucomplete' " To be compared with ncm2
"Plug 'plytophogy/vim-virtualenv' " Do I need it?
Plug 'dense-analysis/ale' "Linting


" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""                        GLOBAL NVIM OPTIONS
"""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Enter> o<ESC>
map <S-Enter> O<ESC>
set incsearch
" Set global number for current line and relative for the rest
set relativenumber number

" " Unfold all text when opening
set nofoldenable

" " Set tab, >> & << to indent 2 columns as spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
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
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
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

" Disable syntax highlighting on inactive windows
let g:diminactive_use_syntax = 1
let g:diminactive_use_colorcolumn = 0
let g:diminactive_enable_focus = 1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" important: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Configuration for Ultisnips
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger            = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger       = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger      = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_alt_sep = ')'
"set term=xterm-256color

" Custom command for right encryption options (no compatible)
":command EncryptionMode set cm=blowfish2|set viminfo=|set nobackup|set nowritebackup
