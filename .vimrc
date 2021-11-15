""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc
"
" Sets opinionated defaults, configures plugins, and sets my
" personal preferences (options and mappings).
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Memo box.
"
" Things to remember:
"   - dedent with Ctrl-D
"   - spellcheck: set spell!
"   - use noun ) for next sentence
"   - dictionary word completion: C-X C-K
"   - substitute last search: %s//<replacement text>/g
"
" Things to learn:
"   - default folding keybindings
"   - ctags
"
"
" TODO: select python line without leading indentation
" TODO: F5 to run file
"
" TODO: for Python, set textwidth=79
" TODO: nnoremap <leader>p Oimport ipdb; ipdb.set_trace()<Esc>
"
" TODO: for C, set ts=4 noexpandtab
" TODO: for Makefile, setlocal tabstop=8 noexpandtab
" TODO: for js and markdown, set ts=2 expandtab
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ==============================================================================
" DEFAULTS
" ==============================================================================

" Source opinionated defaults
runtime opinions.vim

" ==============================================================================
" OPTIONS - PERSISTENCE
" ==============================================================================

set swapfile
set nobackup
set noundofile

" When saving sessions, ignore global/local options and folds
set sessionoptions-=options
set sessionoptions-=folds

" ==============================================================================
" OPTIONS - WINDOW
" ==============================================================================

" Always show status line
set laststatus=2

" Resize splits when the window is resized
augroup resize_splits
    autocmd!
    autocmd VimResized * :wincmd =
augroup END

" ==============================================================================
" OPTIONS - TEXT DISPLAY
" ==============================================================================

" Make the line the cursor is on easier to spot
set cursorline

" Wrapping behavior:
"   - turn on soft wrap for long lines
"   - wrap at 80 characters
"   - try to wrap between words
"   - show a marker when a line was wrapped
"   - show a red line length warning column
set wrap textwidth=80 linebreak showbreak=↪ colorcolumn=+1

" Turn on `:set list` to substitute these display characters for whitespace
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:⌴

" Tweak display of deleted lines in diffs
set fillchars=diff:⣿

" ==============================================================================
" OPTIONS - TEXT MOVEMENT
" ==============================================================================

" Vertical scrolling behavior: keep a few lines visible when scrolling
set scrolloff=3

" Horizontal scrolling behavior (for unwrapped text):
"   - Scroll smoothly, one column at a time
"   - Keep a few columns visible when scrolling unwrapped text
set sidescroll=1 sidescrolloff=10

" ==============================================================================
" OPTIONS - EDITING
" ==============================================================================

" Indent behavior:
"   - tab characters are 4 columns
"   - ditto for a level of identation
"   - ditto for a tab or backspace keypress
"   - don't add tabs when inserting, only spaces
set tabstop=4 shiftwidth=0 softtabstop=-1 expandtab

" Formatoptions behavior:
"   - allow formatting of comments with gq
"   - add comment leader (// or # etc.) when pressing Enter to start a new line
"   - remove comment leader when joining lines
"   - line up text in numbered lists
"   - don't break a line after a one-letter word
set formatoptions=qrjn1

" Briefly flash cursor to show matching brackets
set showmatch matchtime=3

" Insert mode Ctrl-N completion behavior:
"   - if there are multiple matches, only auto-insert the common text
"   - always show the popup menu, even if there's only one match
set completeopt=longest,menuone,preview

" Use C-X C-K for dictionary word completion
set dictionary=/usr/share/dict/words

" Turn on virtual editing for Visual block mode. This makes it possible to place
" the cursor in the middle of a tab.
set virtualedit+=block

" ==============================================================================
" OPTIONS - SEARCH
" ==============================================================================

" Show search count message (e.g. [1/5])
set shortmess-=S

" ==============================================================================
" OPTIONS - NORMAL MODE
" ==============================================================================

" Disable timeout on keypresses (like leader key)
set notimeout nottimeout

" Open splits below and to right
set splitbelow splitright

" ==============================================================================
" OPTIONS - COMMAND MODE
" ==============================================================================

set wildignore+=.git,*.DS_Store,*.pyc

" ==============================================================================
" OPTIONS - GUI
" ==============================================================================

"colorscheme qqzellner
"colorscheme macvim

if has('gui_running')
    "set guifont=Monospace\ 10
    "set guifont=ProFontWindows:h9
    "set lines=126

    set guifont=Menlo-Regular:h11

    " Tab heading shows full filename if file isn't in cwd
    set guitablabel=%F

    " Show scrollbars
    set go+=r go+=L
endif

" Tiny text, narrow enough to fit 3 80-col vsplits on laptop screen
function TinySize()
    windo set nowrap
    "set guifont=ProFontWindows:h9
    set guifont=Menlo-Regular:h10
    set go+=r go+=L
endfunction

" Back to normal text
function NormalSize()
    windo set wrap
    set guifont=Menlo-Regular:h11
    set go-=l go-=L go-=r go-=R
endfunction

nnoremap <leader>3 :call TinySize()<CR>
nnoremap <leader>2 :call NormalSize()<CR>




" ==============================================================================
" MAPPINGS - FIXUPS
" ==============================================================================

nnoremap ; :

nnoremap Y y$

noremap j gj
noremap k gk

xnoremap < <gv
xnoremap > >gv

map ZZ <Nop>
map <F1> <Nop>
inoremap <F1> <Nop>
map K <Nop>

" ==============================================================================
" MAPPINGS - PERSONAL PREFERENCE
" ==============================================================================

let mapleader = ","
let maplocalleader = "\\"

" Ctrl-S writes the file and exits Insert mode
noremap <silent> <C-S> :w<CR>
inoremap <silent> <C-S> <Esc>:w<CR>

" Heresy!
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Change tabs
nnoremap = gt<CR>
nnoremap - gT<CR>
nnoremap <leader>= =
nnoremap <leader>t :tabnew<CR>

nnoremap <leader>w :tabclose<CR>
nnoremap <leader>q :quit<CR>

nnoremap <C-h>  <C-w>h
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-l>  <C-w>l
nnoremap <leader>v :rightbelow vnew<CR>

" ==============================================================================
" MAPPINGS - UTILITY
" ==============================================================================

" Split line (sister to [J]oin lines)
nnoremap S i<cr><esc><right>

" cd to path of current file
nnoremap <leader>C :cd %:p:h<cr>:pwd<cr>

" Clean trailing whitespace in current file
nnoremap <localleader>w :%s/\s\+$//<cr>:let @/=''<cr>

" Edit .vimrc and reload after saving
nnoremap <leader>M :tabe $MYVIMRC<CR>
augroup autoreload_vimrc
    autocmd!
    autocmd bufwritepost .vimrc nested source $MYVIMRC
augroup end

" Toggle soft wrap
nnoremap <leader>r :set wrap!<CR>

" Toggle list mode
nnoremap <leader>L :set list!<CR>

"TODO: get rid of this if I don't miss it
"" Fix linewise visual selection inside tags and brackets
"nnoremap VV V
"nnoremap Vit vitVkoj
"nnoremap Vat vatV
"nnoremap Vab vabV
"nnoremap VaB vaBV

" Insert ISO 8601 date/time
iabbrev xxdate <c-r>=strftime("%Y-%m-%d %H:%M")<cr>

" ==============================================================================
" MAPPINGS - DIRECTORIES
" ==============================================================================

" cd to frequently used project directories
nnoremap <leader>ddv :cd ~/dev/dotfiles<cr>:pwd<cr>

" ==============================================================================
" MAPPINGS - QUICKFIX LIST AND LOCATION LIST
" ==============================================================================

nnoremap <leader>l :copen<cr>
nnoremap <localleader>l :lopen<cr>
nnoremap <leader>k :cclose<cr>:lclose<cr>

let macvim_skip_cmd_opt_movement = 1
nnoremap <M-Down> :cnext<cr>zvzz
nnoremap <M-Up> :cprevious<cr>zvzz
nnoremap <D-Down> :lnext<cr>zvzz
nnoremap <D-Up> :lprevious<cr>zvzz

" ==============================================================================
" MAPPINGS - SEARCH
" ==============================================================================

" Search for word under cursor behavior:
"   - pressing * starts a search but doesn't move to the next match (use n or N)
"   - pressing # does nothing, don't use it
nnoremap * *<c-o>
nnoremap # <Nop>

" Next search match behavior:
"   - jump to show match in middle of the window
"   - open folds as needed to show the match
nnoremap n nzzzv
nnoremap N Nzzzv

" Use Vim very-magic regex syntax (more like Python/Perl regexes)
nnoremap / /\v
vnoremap / /\v

" Hide highlight for search matches
noremap <leader><space> :noh<cr>:call clearmatches()<cr>




" ==============================================================================
" PLUGINS
" ==============================================================================

" To manually install vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin()

    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'bkad/camelcasemotion'
    Plug 'scrooloose/nerdcommenter'
    Plug 'mileszs/ack.vim'

    " TODO: syntastic
    " TODO: ale ?

    call plug#end()
endif

" To install plugins, run:
"   PlugInstall

" ==============================================================================
" MAPPINGS - PLUGINS
" ==============================================================================

let g:ctrlp_map = '<leader>,'
let g:ctrlp_show_hidden = 1

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

nnoremap <leader>gs :Git<cr>
nnoremap <leader>gb :Git blame<cr>

" nerdcommenter uses prefix <leader>c

map <silent> w <Plug>CamelCaseMotion_w
map <silent> e <Plug>CamelCaseMotion_e

map <leader>/ :Ack!
map <leader>? :Ack! <cword><cr>

" Use ripgrep or the silver searcher if available
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
