" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  " Don't try to be vi compatible
  if &compatible
    set nocompatible
  endif

  " NeoBundle Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundle required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Helps force plugins to load correctly when it is turned back on below
filetype off
 
" TODO: Load plugins here (pathogen or vundle)
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'scrooloose/nerdtree'			    " File searching show folder tree
NeoBundle 'kien/ctrlp.vim'				    " Fuzzy File searching
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'gregsexton/gitv'
" NeoBundle 'SirVer/ultisnips'			    " Snippet to Github
" NeoBundle 'Trevoke/ultisnips-rspec'
" NeoBundle 'suan/vim-instant-markdown'	    " better looking statusline
NeoBundle 'bling/vim-airline'			    " Status bar color
NeoBundle 'tpope/vim-dispatch'			    " async external commands with output
NeoBundle 'elzr/vim-json'				    " Syntax highlight for JSON
NeoBundle 'nathanaelkane/vim-indent-guides'	" Visually displaying indent levels
NeoBundle 'tpope/vim-surround'			    " manipulation of surrounding parens, quotes, etc.
NeoBundle 'tpope/vim-endwise'               " add 'end' in ruby
" git
NeoBundle 'airblade/vim-gitgutter'		    " git diff in the gutter (sign column) and stages/reverts hunks
NeoBundle 'junegunn/vim-easy-align'         " Alignment plugin.

" Ruby/Rails
NeoBundle 'vim-ruby/vim-ruby'               " ruby support
NeoBundle 'tpope/vim-rails'				    " rails support
NeoBundle 'tpope/vim-bundler'			    " bundler integration (e.g. :Bopen)
NeoBundle 'tpope/vim-rake'				    " rake integration
NeoBundle 'ecomba/vim-ruby-refactoring'	    " ruby refactoring
NeoBundle 'josemarluedke/vim-rspec'		    " lightweight Rspec runner for Vim

" Syntax Support
NeoBundle 'Valloric/YouCompleteMe'		    " Syntax completion
NeoBundle 'scrooloose/syntastic'		    " Syntax checking

" Search
NeoBundle 'rking/ag.vim'				    " Content searching

" color themes
NeoBundle 'altercation/vim-colors-solarized'

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

call neobundle#end()

" Installation. check.
NeoBundleCheck
"----------------------------------------------------------------

" Turn on syntax highlighting
syntax on
 
" NeoBundle Required - For plugins to load correctly
filetype plugin indent on
 
" TODO: Pick a leader key
" let mapleader = ","
 
" Security
set modelines=0
 
set number                           		" Show line numbers
set numberwidth=5   						" Number column width
set ruler							 		" Show file stats
set visualbell						 		" Blink cursor on error instead of beeping
set hidden									" Allow hidden buffers

"set list listchars=tab:»·,trail:·,nbsp:·    " display extra whitespace
set cursorline                              " highlight current line

" Indent
set autoindent
set smartindent

" Encoding
set encoding=utf-8
 
" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2 						" size of a hard tabstop
set shiftwidth=2 					" size of an "indent"
set softtabstop=2
set expandtab
set noshiftround
 
" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
 
" Move up/down editor lines
nnoremap j gj
nnoremap k gk
 
" Rendering
set ttyfast
 
" Status bar
set laststatus=2
 
" Last line
set showmode
set showcmd
 
" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch				" do incremental searching
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
 
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
 
" custom mappings
"----------------------------------------------------------------
imap ;; <Esc>

" Textmate holdouts
 
" Formatting
map <leader>q gqip
 
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Ctrl + S to save file
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
\|    if empty(bufname('%'))
\|        browse confirm write
\|    else
\|        confirm write
\|    endif
\|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>


" Color scheme (terminal)
"----------------------------------------------------------------
" set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
syntax enable
colorscheme solarized


" Use zsh for bash
"----------------------------------------------------------------
set shell=/bin/zsh
" for vim-instant-markdown
" set shell=bash\ -i

" NERDTree, Use F3 for toggle NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>

" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 

" for itchyne/lightline
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2

" ag.vim
"----------------------------------------------------------------
let g:agprg="/usr/local/bin/ag --column"

" find current world quickly using Ag
nnoremap ff :Ag <C-R><C-W><CR>

" CtrlP config
"----------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-,>'],
  \ }
let g:ctrlp_use_caching = 0

" indent-guides config
"----------------------------------------------------------------
set ts=4 sw=4 et
let g:indent_guides_start_lvel = 2
let g:indent_guides_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
hi IndentGuidesEven ctermbg=black
hi IndentGuidesOdd ctermbg=fg


" gitgutter config
"----------------------------------------------------------------
let g:gitgutter_escape_grep = 1
let g:gitgutter_highlight_lines = 0
"let g:gitgutter_realtime = 0

" syntastic config
"----------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vimfiler
"----------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\|\.swp\)$'
noremap <Leader>k :VimFiler<CR>
" autocmd VimEnter * VimFilerExplorer  " Display sidebar after starting Vim

" airline config
"----------------------------------------------------------------
set laststatus=2
set encoding=utf-8
set ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1       " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'   " Show just the filename

