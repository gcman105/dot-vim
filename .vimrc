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

"Plug 'Shougo/neco-vim',
"Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'arcticicestudio/nord-vim'
Plug 'cespare/vim-toml'
Plug 'dNitro/vim-pug-complete'
Plug 'digitaltoad/vim-pug'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
"Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree'
Plug 'mcchrish/nnn.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'posva/vim-vue'
Plug 'psf/black', { 'tag': '19.10b0' }
"Plug 'sbdchd/neoformat', {'on': 'Neoformat'}
Plug 'scrooloose/nerdcommenter'
"Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'
Plug 'westurner/venv.vim'
"Plug 'ycm-core/YouCompleteMe'

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

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#face00' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#d97218' gui=underline ctermfg=81 cterm=underline
augroup END

"command tabo, which makes the current tab the only tab
autocmd BufWinEnter,BufNewFile * silent tabo
if has('nvim')
  colorscheme nord
else
  colorscheme nord
endif

filetype indent on
filetype on                     " Enable filetypes
filetype plugin on

let base16colorspace=256        " Access colors present in 256 colorspace
let g:EasyMotion_keys='hjklasdfbvcxuiopqwernm,.'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger             =  "<Tab>"
let g:UltiSnipsJumpBackwardTrigger       =  "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger        =  "<Tab>"
let g:UltiSnipsListSnippets              =  "<S-Tab>"
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:black_virtualenv = expand('/Users/gcman105/dotfiles/venv')
let g:gist_use_password_in_gitconfig = 0
let g:loaded_python_provider = 1 " Disable Python 2 support:
let g:markdown_composer_open_browser = 0
"let g:netrw_banner = 0
"let g:netrw_browse_split=2
"let g:netrw_home= '$HOME/dotfiles'
"let g:netrw_list_hide= netrw_gitignore#Hide()
"let g:netrw_liststyle= 3
"let g:netrw_winsize = 25
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:python3_host_prog = expand('/Users/gcman105/dotfiles/venv/bin/python')
let g:qs_buftype_blacklist = ['terminal', 'nofile']
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
let g:qs_max_chars=150
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = "Vifm"
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let mapleader=" "        " Want a different map Leader than \

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set autoindent
set autowrite
set background=dark             " or light
set backspace=2                 " Allow backspacing over indent, eol, and the start of an insert
set clipboard=unnamed
set cmdheight=2                 " Give more space for displaying messages.
set colorcolumn=80
set cpoptions+=$                " Show $ at the end of a change command
set cursorline
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
set nobackup                    " Some servers have issues with backup files, see COC #649.
set noerrorbells
set noignorecase
set nostartofline               " Do not jump to first character with page commands.
set noswapfile
set nowritebackup
set number                      " Show lines numbers
set relativenumber              " Make line numbers relative
set rtp+=/usr/local/opt/fzf
set scrolloff=5                 " Keep the cursor 3 lines off of bottom when scrolling
set shiftround
set shiftwidth=4                " Indentation amount for < and > commands.
set shortmess+=c                " Don't pass messages to ins-completion-menu.
set showfulltag                 " When completing by tag, show the whole tag, not just the function name
set showmatch                   " Show matching brackets.
set signcolumn                  " Always show the signcolumn, otherwise it would shift the text each time.
set smartindent
set softtabstop=4
set spelllang=en_gb             " Set region to British English
set splitbelow                  " More natural split below
set splitright                  " More natural split right
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set synmaxcol=512               " Syntax coloring lines that are too long just slows down the world
set tabstop=4                   " Render TABs using this many spaces.
set termguicolors               " important!!
set textwidth=79
set timeoutlen=800              " A little bit more time for macros
set ttimeoutlen=50              " Make Esc work faster
set undodir=~/.vim/undodir
set undofile
set updatetime=300              " Longer updatetime (default is 4000 ms = 4 s) leads to delays and poor user experience
set virtualedit=all             " Allow cursor into places it cant normally go
set wildmenu                    " Command line completion
set wrap

highlight ColorColumn ctermbg=0 guibg=lightgrey

syntax on

" }}} end of settings -------------------------------------



"-----------------------------------------------------------------------------
" Keyboard mapping stuff {{{1
"-----------------------------------------------------------------------------

" <F1> has been mapped to caps_lock in Karabiner

cnoremap W! w !sudo tee % >/dev/null   " sudo write this
cnoremap jj <esc>
inoremap <c-l> <space>=><space>  " Insert a hash rocket with <c-l>
inoremap <silent><expr> <c-space> coc#refresh() " Use <c-space> to trigger completion.
inoremap jj <esc>
map <Leader><Leader> <Plug>(easymotion-bd-W)
map <Leader>m <Plug>(easymotion-prefix)
nmap <F6> <plug>(QuickScopeToggle)
nmap <leader>a  <Plug>(coc-codeaction-selected) " Applying codeAction to the selected region.
nmap <leader>ac  <Plug>(coc-codeaction) " Remap keys for applying codeAction to the current line.
nmap <leader>f  <Plug>(coc-format-selected) " Formatting selected code.
nmap <leader>qf  <Plug>(coc-fix-current) " Apply AutoFix to problem on the current line.
nmap <leader>rn <Plug>(coc-rename) " Symbol renaming.
nmap <silent> <TAB> <Plug>(coc-range-select)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <C-b> :buffers<CR>:buffer<Space>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Down> :cn<CR>
nnoremap <F10> :%s/\s\+$//e<CR>  " <F10> removes trailing white space
nnoremap <F18> <C-i>             " Using Karabiner to avoid collision between <Tab> and <C-i>
nnoremap <F5> @@| " Map Enter key to run last macro
nnoremap <F7> :call LanguageClient_contextMenu()<CR>
nnoremap <F9> :Black<CR>
nnoremap <Leader>et :edit ~/.tmux.conf<CR>
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>ez :edit ~/.zshrc<CR>
nnoremap <Leader>fc :cclose<cr>
nnoremap <Leader>fo :cope<cr>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>hl :Gist -l<CR>
nnoremap <Leader>hp :Gist<CR>
nnoremap <Leader>i :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>
nnoremap <Leader>j :jumps<cr>
nnoremap <Leader>m :marks<CR>
nnoremap <Leader>n :Vifm<cr>
nnoremap <Leader>1 :only<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>st :so ~/.tmux.conf<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>
nnoremap <Leader>sz :so ~/.zshrc<CR>
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Left> :cpf<CR>
nnoremap <Right> :cnf<CR>
nnoremap <Tab> za
nnoremap <Up> :cp<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>v  :Vifm . .<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent>` <nop>
nnoremap <silent>´ <nop>
"nnoremap 0 ^ " Go to the first non-blank character of a line
"nnoremap ^ 0 " Just in case you need to go to the very beginning of a line
noremap <C-Down> ddp             " bubble lines
noremap <C-Up> ddkP              " bubble lines
noremap <F2> :set list!<CR>
noremap <F3> :set spell!<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
noremap <F8> :TagbarToggle<CR>
omap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
vnoremap <C-Down> xp`[V`]        "Bubble multiple lines
vnoremap <C-Up> xkP`[V`]         "Bubble multiple lines
vnoremap <Leader>hv   :'<,'>Gist<CR>
vnoremap <Leader>ib :!align<cr>  " Align selected lines
vnoremap <silent>` <nop>
vnoremap <silent>´ <nop>
xmap <F6> <plug>(QuickScopeToggle)
xmap <leader>a  <Plug>(coc-codeaction-selected) " Applying codeAction to the selected region.
xmap <leader>f  <Plug>(coc-format-selected) " Formatting selected code.
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap af <Plug>(coc-funcobj-a)
xmap if <Plug>(coc-funcobj-i)

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nnoremap <silent> <Leader>f :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ "\<C-h>" :
      \ coc#refresh()



" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" }}} end of Keyboard mapping stuff ----------------------



" FZF stuff {{{2 -------------------------------------------------------------

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



" coc stuff {{{2 -------------------------------------------------------------

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_filetype_map = {
    \ 'pandoc': 'markdown',
    \ }


" }}} end of coc stuff -----------------------------------



fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType python set foldmethod=indent

autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

