" gcman105's .vimrc file
" Author: Gary C = gcman105 <gary@gcman105.com>
" https://gcman105.com/

source /Users/gcman105/.config/.secrets
"-----------------------------------------------------------------------------
" vim-plug plugins {{{1
"-----------------------------------------------------------------------------
" Make sure you use single quotes

if has('nvim')
  call plug#begin($XDG_CONFIG_HOME.'/nvim/plugged')
else
  call plug#begin($XDG_CONFIG_HOME.'/vim/plugged')
endif
"Plug 'arnaud-lb/vim-php-namespace'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
"Plug 'frankier/neovim-colors-solarized-truecolor-only',
"Plug 'hkupty/iron.nvim'
"Plug 'jeetsukumaran/vim-pythonsense'
"Plug 'kassio/neoterm'
"Plug 'leafgarland/typescript-vim'
"Plug 'mattn/emmet-vim'
"Plug 'mhartington/nvim-typescript'
"Plug 'rizzatti/dash.vim'
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/neomru.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
"Plug 'wincent/command-t'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
"Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
"Plug 'jiangmiao/auto-pairs'
"Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
"Plug 'mattn/vim-lsp-settings'
Plug 'mhinz/vim-startify'
Plug 'posva/vim-vue'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete-necovim.vim'
"Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'psf/black'
Plug 'racer-rust/vim-racer'
Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Shougo/deoplete-zsh'
Plug 'Shougo/neco-vim',
Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-python/python-syntax'
Plug 'westurner/venv.vim'
"Plug 'wincent/command-t'

" Order dependant plugins ----------------------------------------------------
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"Plug 'davidhalter/jedi-vim'
"let g:jedi#completions_enabled = 0
"Plug 'deoplete-plugins/deoplete-jedi'

" ~/.vimrc, declare this variable before polyglot is loaded
"let g:polyglot_disabled = ['python']
Plug 'sheerun/vim-polyglot'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()
" }}} end of vim-plug plugins ------------------------------------------------

"-----------------------------------------------------------------------------
" Settings {{{1
"-----------------------------------------------------------------------------
autocmd BufWinEnter,BufNewFile * silent tabo  "command tabo, which makes the current tab the only tab
if has('nvim')
  colorscheme base16-ocean
else
  colorscheme base16-tomorrow-night-eighties
endif
filetype indent on
filetype on                     " Enable filetypes
filetype plugin on
let base16colorspace=256        " Access colors present in 256 colorspace
let g:black_virtualenv = expand('/Users/gcman105/dotfiles/venv')
let g:python3_host_prog = expand('/Users/gcman105/dotfiles/venv/bin/python')
"let g:ruby_host_prog = expand('/Users/gcman105/.rvm/rubies/ruby-2.6.3/bin/ruby')
"let g:jedi#use_splits_not_buffers = "right"
let mapleader="\<Space>"        " Want a different map Leader than \
set autoindent
set autowrite
set background=dark             " or light
set backspace=2                 " Allow backspacing over indent, eol, and the start of an insert
set clipboard=unnamed
set cmdheight=2
set cpoptions+=$                " Show $ at the end of a change command
set expandtab                   " Insert spaces when TAB is pressed.
set foldcolumn=3                " Set the fold gutter width
set foldlevel=3                 " Set the opening fold level
set foldmethod=marker
set foldopen+=jump
set formatoptions=qrn1
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set hidden                      " Switch between buffers without saving
set hlsearch                    " Highlight searching
set incsearch                   " Set incremental searching"
set laststatus=2                " Always show the status line
set lazyredraw                  " Don't update the display while executing macros
set mouse=a
set noignorecase
set nostartofline               " Do not jump to first character with page commands.
set number                      " Show lines numbers
set relativenumber              " Make line numbers relative
set scrolloff=3                 " Keep the cursor 3 lines off of bottom when scrolling
set shiftround
set shiftwidth=2                " Indentation amount for < and > commands.
set showfulltag                 " When completing by tag, show the whole tag, not just the function name
set showmatch                   " Show matching brackets.
set smartindent
set spelllang=en_gb             " Set region to British English
set splitbelow                  " More natural split below
set splitright                  " More natural split right
set synmaxcol=512               " Syntax coloring lines that are too long just slows down the world
set tabstop=4                   " Render TABs using this many spaces.
set termguicolors               " important!!
set textwidth=79
set timeoutlen=800              " A little bit more time for macros
set ttimeoutlen=50              " Make Esc work faster
set virtualedit=all             " Allow cursor into places it cant normally go
set wildmenu                    " Command line completion
set wrap
syntax on

" }}} end of settings --------------------------------------------------------


"-----------------------------------------------------------------------------
" Keyboard mapping stuff {{{1
"-----------------------------------------------------------------------------
" normal mode key mappings {{{2 ----------------------------------------------
"noremap , :
" Map CTRL-E to do what ',' used to do
"nnoremap <C-e> ,

nnoremap <Tab> za

" Map function keys
" <F1> has been mapped to caps_lock in Karabiner
noremap <F2> :set list!<CR>
noremap <F3> :set spell!<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
nnoremap <F5> @@| " Map Enter key to run last macro

nnoremap <F7> :call LanguageClient_contextMenu()<CR>
noremap <F8> :TagbarToggle<CR>
nnoremap <F9> :Black<CR>
" <F10> removes trailing white space
nnoremap <F10> :%s/\s\+$//e<CR>

" Using Karabiner to avoid collision between <Tab> and <C-i>
nnoremap <F18> <C-i>

" Remap arrow keys
nnoremap <Up> :cp<CR>
nnoremap <Down> :cn<CR>
nnoremap <Left> :cpf<CR>
nnoremap <Right> :cnf<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent>´ <nop>
nnoremap <silent>` <nop>

"Bubble single lines (kicks butt)
noremap <C-Up> ddkP
noremap <C-Down> ddp

" A way to iter through buffers
nnoremap <C-b> :buffers<CR>:buffer<Space>
" }}} end of normal mode key mappings --------------------

" visual mode key mappings {{{2 ----------------------------------------------
" Map CTRL-E to do what ',' used to do
"vnoremap <C-e> ,
vnoremap <silent>´ <nop>
vnoremap <silent>` <nop>
vnoremap <Leader>hv   :'<,'>Gist<CR>

" Align selected lines
vnoremap <Leader>ib :!align<cr>

"Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]
" }}} end of visual mode key mappings --------------------

" insert mode key mappings {{{2 ----------------------------------------------
inoremap jj <esc>

" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>

" Emmet expandtab
"inoremap <C-e><C-e> <C-y>,
" }}} end of insert mode key mappings --------------------

" command mode key mappings {{{2 ---------------------------------------------
cnoremap jj <esc>

" sudo write this
cnoremap W! w !sudo tee % >/dev/null

map <Leader><Leader> <Plug>(easymotion-prefix)
" }}} end of command mode key mappings -------------------

" Leader mode key mappings {{{2 ----------------------------------------------

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
nnoremap <Leader>d :NERDTreeToggle<cr>
nnoremap <Leader>et :edit ~/.tmux.conf<CR>
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>ez :edit ~/.zshrc<CR>
nnoremap <Leader>fc :cclose<cr>
nnoremap <Leader>fo :cope<cr>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <Leader>hl :Gist -l<CR>
nnoremap <Leader>hp :Gist<CR>
nnoremap <Leader>i :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>
nnoremap <Leader>jo :jumps<cr>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>st :so ~/.tmux.conf<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>
nnoremap <Leader>sz :so ~/.zshrc<CR>
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
nnoremap <Leader>w :write<CR>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
" }}} end of Leader mode key mappings --------------------
" }}} end of Keyboard mapping stuff ----------------------

let g:gist_use_password_in_gitconfig = 0

" netrw setup and key bindings {{{2 ------------------------------------------
let g:netrw_home= '$HOME/dotfiles'
let g:netrw_liststyle= 3
let g:netrw_list_hide= netrw_gitignore#Hide()
" }}} end of netrw setup and key bindings ----------------

" bookmarks setup and key bindings {{{2 --------------------------------------
"map <Leader>m g:netrw-mB
" }}} end of bookmarks setup and key bindings ------------

"let g:pymode_options_max_line_length=120
"autocmd FileType python set colorcolumn=120

" deoplete setup and key bindings {{{2 ---------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', 'deoplete.log')
" }}} end of typescript setup and key bindings -----------

" ultisnips setup and key bindings {{{-2 -------------------------------------
let g:UltiSnipsExpandTrigger             =  "<Tab>"
let g:UltiSnipsListSnippets              =  "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger        =  "<Tab>"
let g:UltiSnipsJumpBackwardTrigger       =  "<S-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}} end of UltiSnips setup and key bindings ------------

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Hide certain files

let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git', '.cache', '.idea', '.vscode', '.DS_Store', '.projectile', '.noseids', 'htmlcov', 'node_modules']

" }}} end of NERDTree setup and key bindings -------------

" Airline stuff {{{2 ---------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
" }}} end of Airline stuff -------------------------------

" Disable Python 2 support:
let g:loaded_python_provider = 1

" PhpInsertUse stuff {{{2 ----------------------------------------------------
" }}} end of PhpInsertUse stuff --------------------------

" FZF stuff {{{2 -------------------------------------------------------------
set rtp+=/usr/local/opt/fzf

" Open buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction
" }}} end of FZF stuff -----------------------------------

" vim-lsp stuff {{{2 ---------------------------------------------------------
let g:LanguageClient_settingsPath = '~/dotfiles/dot-nvim/ls-settings.json'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['~/dotfiles/venv/bin/pyls', '-vv', '--log-file', '~/pyls.log'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

"let g:LanguageClient_diagnosticsList='Location'

"if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls']},
        "\ 'whitelist': ['python'],
        "\ })
"endif

"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> <f2> <plug>(lsp-rename)
    "" refer to doc to add more commands
"endfunction

"set foldmethod=expr
  "\ foldexpr=lsp#ui#vim#folding#foldexpr()
  "\ foldtext=lsp#ui#vim#folding#foldtext()

"let g:lsp_fold_enabled = 1

"augroup lsp_install
    "au!
    "" call s:on_lsp_buffer_enabled only for languages that has the server registered.
    "autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    "\ 'name': 'necovim',
    "\ 'whitelist': ['vim'],
    "\ 'completor': function('asyncomplete#sources#necovim#completor'),
    "\ }))

"if has('python3')
    "let g:UltiSnipsExpandTrigger="<c-e>"
    "call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        "\ 'name': 'ultisnips',
        "\ 'whitelist': ['*'],
        "\ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        "\ }))
"endif
" }}} end of vim-lsp stuff -------------------------------

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

