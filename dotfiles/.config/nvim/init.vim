" Variables {{{
" Set XDG_CONFIG_HOME to load user's config files
if exists($XDG_CONFIG_HOME)
  let vimrc_dir = $XDG_CONFIG_HOME . "/vim"
else
  let vimrc_dir = $HOME
endif

let vimrc_conf_post = expand(resolve(vimrc_dir . "/.vimrc"))

" }}}

" Precustomization {{{
" Example:
" if filereadable(vimrc_conf_post)
"   execute 'source '. vimrc_conf_post
" endif
" }}}

" General {{{
" Use indentation for folds
set foldmethod=marker
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

nmap zt :call <SID>ToggleFold()<CR>
function! s:ToggleFold()
    if &foldmethod == 'marker'
        let &l:foldmethod = 'indent'
    else
        let &l:foldmethod = 'marker'
    endif
    echo 'foldmethod is now ' . &l:foldmethod
endfunction

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
if ! exists("mapleader")
  let mapleader = ","
endif

if ! exists("g:mapleader")
    let g:mapleader = ","
endif

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Use par for prettier line formatting
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

" Kill the damned Ex mode.
nnoremap Q <nop>

" Make <c-h> work like <c-h> again (this is a problem with libterm)
if has('nvim')
  nnoremap <BS> <C-w>h
endif

" }}}

" vim-plug {{{

set nocompatible

if has('nvim')
  call plug#begin('~/.config/nvim/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" Support bundles
" send commands to tmux
Plug 'jgdavey/tslime.vim'
" just to support async tasks
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Supertab to use <Tab> for all insert completion needs (:help ins-completion).
Plug 'ervandew/supertab'
" make
Plug 'neomake/neomake'
" better buffer delete
Plug 'moll/vim-bbye'
" display visualy indentation
Plug 'nathanaelkane/vim-indent-guides'
" Initialize python support
Plug 'roxma/python-support.nvim'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Git
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Just run :Extradite
Plug 'int3/vim-extradite'
" Plug 'vim-scripts/gitignore'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

"fzfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" :TagbarToggle
Plug 'majutsushi/tagbar'

" Text manipulation
Plug 'vim-scripts/Align'
" autoformat
Plug 'chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
" :MundoToggle
Plug 'simnalamburt/vim-mundo'
" gcc
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
map \\ <Plug>(easymotion-s)

" Sane paste in insert mode
Plug 'ConradIrwin/vim-bracketed-paste'

" 
Plug 'jiangmiao/auto-pairs'

" autocomplite
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Colorscheme
Plug 'vim-scripts/wombat256.vim'
Plug 'morhetz/gruvbox'

" Color codes highlight
Plug 'chrisbra/Colorizer'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Langs
Plug 'sheerun/vim-polyglot'
" Clang syntax hilighting
Plug 'arakashic/chromatica.nvim'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

"" Custom bundles

" Example:
" if filereadable(user_plugins)
"   execute 'source '. user_plugins
" endif


set tags=tags;/
set cst
set csverb

call plug#end()

" }}}

" Deoplete {{{
"
let g:deoplete#enable_at_startup = 1

"}}}

" Autostart {{{
" Example: Call colorizer by default
" autocmd VimEnter * if exists(":ColorHighlight") | ColorHighlight | endif
" }}}

" Fzf config {{{
" install the_silver_searcher on your system
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :GFiles<CR>
  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>fw :Windows<CR>
  nnoremap <silent> <leader>fl :BLines<CR>
  nnoremap <silent> <leader>ft :BTags<CR>
  nnoremap <silent> <leader>fT :Tags<CR>
  nnoremap <silent> <leader>fh :History<CR>
  nnoremap <silent> <leader>/ :Ag<CR>

  vnoremap <silent> <leader>f* :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>fc :Commits<CR>
  nnoremap <silent> <leader>fs :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)


  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}

" VIM user interface {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show current position
set ruler
set number relativenumber

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=
endif

" Force redraw
map <silent> <leader>r :redraw!<CR>

" Turn mouse mode on
nnoremap <leader>ma :set mouse=a<cr>

" Turn mouse mode off
nnoremap <leader>mo :set mouse=<cr>

" Default to mouse mode off
set mouse=

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" }}}

" Colors and Fonts {{{

try
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'soft'
" colorscheme wombat256mod "gruvbox
colorscheme gruvbox


catch
endtry

"""
" Wombat fixes
"""

" Adjust signscolumn to match wombat
hi! link SignColumn LineNr

" " Use pleasant but very visible search hilighting
" hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
" hi! link Visual Search
"
" " Match wombat colors in nerd tree
" hi Directory guifg=#8ac6f2
" "
" " Searing red very visible cursor
" hi Cursor guibg=red

"""
" EOF Wombat fixes
"""

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set guitablabel=%M\ %t
endif


set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf8
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" }}}

" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile


set undodir=~/.vim/undo_files
set undofile

" Source the vimrc file after saving it
augroup sourcing
autocmd!
if has('nvim')
  autocmd bufwritepost init.vim source $MYVIMRC
else
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

" }}}

" Text, tab and indent related {{{

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces, unless the file is already
" using tabs, in which case tabs will be inserted.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Copy and paste to os clipboard
vmap <leader>y "*y
vmap <leader>d "*d
vmap <leader>p "*p

vnoremap <C-/> gcc

" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" move & center
nnoremap K kzz
nnoremap J jzz
nnoremap P Pzz
nnoremap G Gzz

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
" nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Return to last edit position when opening files (You want this!)
augroup last_edit
autocmd!
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
augroup END
" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" See :help window-resize

" Sane vim split moving
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" don't close buffers when you aren't displaying them
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" Neovim terminal configurations
if has('nvim')
  " Use <Esc> to escape terminal insert mode
  tnoremap <Esc> <C-\><C-n>
endif

" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" }}}

" Editing mappings {{{

" Utility function to delete trailing white space
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc

" }}}

" Spell checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" }}}

" Helper functions {{{

function! CmdLine(str)
exe "menu Foo.Bar :" . a:str
emenu Foo.Bar
unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
let l:saved_reg = @"
execute "normal! vgvy"

let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")

if a:direction == 'b'
  execute "normal ?" . l:pattern . "^M"
elseif a:direction == 'gv'
  call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
elseif a:direction == 'replace'
  call CmdLine("%s" . '/'. l:pattern . '/')
elseif a:direction == 'f'
  execute "normal /" . l:pattern . "^M"
endif

let @/ = l:pattern
let @" = l:saved_reg
endfunction

" }}}

" Slime {{{

vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars

" }}}

" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 0

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>n <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>N <ESC>:NERDTreeToggle<CR>

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'


let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif



" }}}

" Alignment {{{

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align
" }}}

" Tags {{{

map <leader>tt :TagbarToggle<CR>
autocmd VimEnter * TagbarToggle


" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
if ! exists("mapleader")
  let mapleader = ","
endif

if ! exists("g:mapleader")
    let g:mapleader = ","
endif

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Use par for prettier line formatting
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

" Kill the damned Ex mode.
nnoremap Q <nop>

" Make <c-h> work like <c-h> again (this is a problem with libterm)
if has('nvim')
  nnoremap <BS> <C-w>h
endif

" }}}


" Git {{{

set diffopt+=vertical
let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
" nmap <leader>gg :copen<CR>:GGrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list)
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

" }}}

" Completion {{{
set completeopt+=longest

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" }}}

" Customization {{{
if filereadable(vimrc_conf_post)
  execute 'source '. vimrc_conf_post
endif
" }}}


