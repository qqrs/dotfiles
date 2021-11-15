""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Opinionated defaults.
"
" This Vim config sources defaults.vim, which is included with Vim and provides
" more modern defaults but is not used automatically if a vimrc is present.
"
" It also sets a few options to more friendly values--these are primarily from:
"   https://github.com/doy/conf/blob/master/vim/plugin/opinionated-defaults.vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==============================================================================
" DEFAULTS
" ==============================================================================

" Use modern Vim defaults. We have to source defaults.vim because these
" defaults are only used automatically when no vimrc is found.
" See: /Applications/MacVim.app/Contents/Resources/vim/runtime/defaults.vim
unlet! skip_defaults_vim
runtime defaults.vim

" Don't jump to last known cursor position when opening files
augroup vimStartup | au! | augroup END"


" ==============================================================================
" GENERAL
" ==============================================================================

" For security reasons, disable modelines (directives at tops of files)
set nomodeline modelines=0


" ==============================================================================
" PERSISTENCE
" ==============================================================================

" Remember 1000 history items (command, search, etc)
set history=1000

" Enable persistent undo (undo even after closing and reopening vim)
if has('persistent_undo')
    let s:undocachedir = $HOME . '/.cache/vim/undo'
    if !isdirectory(s:undocachedir)
        call mkdir(s:undocachedir, 'p')
    endif
    exe "set undodir=" . s:undocachedir
    set undofile
endif

" Use a separate swapfile directory
let s:swapfiledir = $HOME . '/.cache/vim/swap'
if !isdirectory(s:swapfiledir)
    call mkdir(s:swapfiledir, 'p')
endif
exe "set directory=" . s:swapfiledir . "//"

" Use a separate view directory
let s:viewdir = $HOME . '/.cache/vim/view'
if !isdirectory(s:viewdir)
    call mkdir(s:viewdir, 'p')
endif
exe "set viewdir=" . s:viewdir


" ==============================================================================
" DISPLAY
" ==============================================================================

" Show as much of a line as possible if it doesn't all fit on the screen
set display=lastline
" More useful display of nonprinting characters (<07> instead of ^G)
set display+=uhex
" Don't redraw in the middle of noninteractive commands (maps, macros, etc)
set lazyredraw


" ==============================================================================
" EDITING
" ==============================================================================

" Automatically use an indent that matches the previous line
set autoindent

" Always join with a single space, even between sentences
set nojoinspaces

" Try to always keep indentation lined up on shiftwidth boundaries
set shiftround
" Keep softtabstop and shiftwidth in sync
set softtabstop=-1


" ==============================================================================
" COMMAND MODE
" ==============================================================================

" Command mode completion behavior:
"   - on first press of tab button:
"     - show list of matches
"     - complete text to common prefix shared by all matches
"   - on second press of tab button:
"     - cycle through full text of matches in order
"   - always use case insensitive matching
set wildmode=longest:list,full
if exists('+wildignorecase')
    set wildignorecase
endif


" ==============================================================================
" SEARCH
" ==============================================================================

" Use ripgrep or the silver searcher if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ $*
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ $*
endif

" Make searches case-insensitive...
set ignorecase
" ... unless they include a capital letter
set smartcase

" Highlight all matches when searching
if has('extra_search')
    set hlsearch
endif


" ==============================================================================
" TERMINAL STUFF
" ==============================================================================

" Wait a much shorter amount of time for escape sequences
" (this makes <Esc> much more responsive)
set ttimeoutlen=50

" Send text to the terminal in such a way that line wrapping is done at the
" terminal level, so copying and pasting wrapped lines works correctly
" (assuming you temporarily unset showbreak)
set ttyfast


" ==============================================================================
" COLORS
" ==============================================================================

" Force vim to use 256 colors
" (it typically can't detect this while in screen/tmux since TERM=screen
" doesn't advertise it, even though ~everything does support it these days)
set t_Co=256

" Globally highlight diff conflict markers
match ErrorMsg '^\(<\||\|=\|>\)\{7\}\([^=].\+\)\?$'
