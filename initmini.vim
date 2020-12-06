"call functions#Plugload()
call plug#begin("~/.nvim/plugged")
let g:coc_disable_startup_warning = 1

" " Theme
 Plug 'dracula/vim'
" " Plug 'chriskempson/base16-vim'
" " Plug 'joshdick/onedark.vim'

"""Fancy startup screen
Plug 'mhinz/vim-startify'
"" Supertab
Plug 'ervandew/supertab'
"""Emmet Plugin
Plug 'mattn/emmet-vim'
""" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-git', 'coc-eslint']

""""" You Complete Me
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

function! BuildYCM(info)
" info is a dictionary with 3 fields
" - name:   name of the plugin
" - status: 'installed', 'updated', or 'unchanged'
" - force:  set on PlugInstall! or PlugUpdate!
if a:info.status == 'installed' || a:info.force
!./install.py
endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Deoplete plugins setup
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neocomplete'
let g:deoplete#enable_at_startup = 1 
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips 
Plug 'SirVer/ultisnips' " Snippets plugin
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"



""" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
""" Git Integration""""""""""""""""""""""""""""""""""""""""""
""" Vim-Fugitive""""Perform basic git command inside vim"""""
Plug 'tpope/vim-fugitive'
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'sodapopcan/vim-twiggy'
Plug 'rbong/vim-flog'

""""" File Explorer with Icons
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" File Search
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" Styles
Plug 'vim-syntastic/syntastic'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'stephenway/postcss.vim', { 'for': 'css' }
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""" General Functionality {{{
""" better terminal integratio
""" substitute, search, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" Close buffers but keep splits
Plug 'moll/vim-bbye'
"  context-aware pasting
Plug 'sickill/vim-pasta'
" Simple folding plug
Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" Writing in vim
Plug 'junegunn/goyo.vim'

" easy commenting motions
Plug 'tpope/vim-commentary'

" mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-unimpaired'

" endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-ragtag'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" tmux integration for vim
Plug 'benmills/vimux'

" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat'

" .editorconfig support
Plug 'editorconfig/editorconfig-vim'

" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'AndrewRadev/splitjoin.vim'

" detect indent style (tabs vs. spaces)
Plug 'tpope/vim-sleuth'

"Vim-Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" END OF PLUG""""""""""""""""""""""""""""""

" Enable theming support
if (has("termguicolors"))
set termguicolors
endif

"
"Emmet Config"""""
"
"let g:user_emmet_mode='n' "Only enable normal mode functions.
"let g:user_emmet_mode='inv' "enable all funtions,which is equal to 
let g:user_emmet_mode='a' "enable all functions in all mode
let g:user_emmet_leader_key='<C-Z>'

" Theme
syntax enable
colorscheme dracula
let python_hightlight_all=1

"nnoremap <C-f> :FZF<CR>
"let g:fzf_action = {
"\ 'ctrl-t': 'tab split',
"\ 'ctrl-s': 'split',
"\ 'ctrl-v': 'vsplit'
"\}
" requires silversearcher-ag
" used to ignore gitignore files
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
"tnoremap <A-j> <C-\><C-n><C-w>j
"tnoremap <A-k> <C-\><C-n><C-w>k
"tnoremap <A-l> <C-\><C-n><C-w>l
"tnoremap <A-h> <C-\><C-n><C-w>h
"
"nnoremap <A-j> <C-w>j
"nnoremap <A-k> <C-w>k
"nnoremap <A-l> <C-w>l
"nnoremap <A-h> <C-w>h
"
" use Ctrl+jkhl to move between split/vsplit panels
"
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H


" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
split term://bash
resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Global settings
"Vim-supertab configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" AutoComplpop like behavior
let g:neocomplete#enable_auto_select =1

if (has('nvim'))
" show results of substition as they're happening
" but don't open a split
set inccommand=nosplit
endif

set clipboard=unnamed
if has('mouse')
set mouse=a
endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

""" Error bells

set errorbells    " ring the bell for errors
set visualbell    " then use a flash instead of a beep sound
set belloff=esc   " hitting escape in normal mode do not give error
set t_vb=
set tm=500
"""""""""""""""""""""""""""""""""""""""""""""""""""

""" Appearance

set number " show line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=↪
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
"    set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set shell=$SHELL
set cmdheight=2 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300

if has ("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

set shortmess+=c

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" toggle invisible characters

" invisible characters to display (with :set list)
set listchars=tab:›\ ,nbsp:␣,trail:•,precedes:«,extends:»
" set listchars=tab:›\ ,space:·,nbsp:␣,trail:•,eol:¬,precedes:«,extends:»
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
" disable background color erase
set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
if (!(has("nvim")))
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
endif

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" General Mappings {{{
" set a map leader for more key combos
let mapleader = ','

" remap esc
"inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" set paste toggle
set pastetoggle=<leader>v

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" Autoremove extra BadWhitespace on Filetype read
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nmap <leader>l :set list!<cr>

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>
map <silent> <C-h> <Plug>WinMoveLeft
map <silent> <C-j> <Plug>WinMoveDown
map <silent> <C-k> <Plug>WinMoveUp
map <silent> <C-l> <Plug>WinMoveRight

nmap <leader>z <Plug>Zoom

map <leader>wc :wincmd q<cr>

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
inoremap <A-j> <Esc>:m .+1<cr>==gi
inoremap <A-k> <Esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" Custom text objects

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

" Interesting word mappings
nmap <leader>0 <Plug>ClearInterestingWord
nmap <leader>1 <Plug>HiInterestingWord1
nmap <leader>2 <Plug>HiInterestingWord2
nmap <leader>3 <Plug>HiInterestingWord3
nmap <leader>4 <Plug>HiInterestingWord4
nmap <leader>5 <Plug>HiInterestingWord5
nmap <leader>6 <Plug>HiInterestingWord6

" open current buffer in a new tab
nmap <silent> gTT :tab sb<cr>
" }}}

" AutoGroups {{{
" file type specific settings
augroup configgroup
autocmd!

" automatically resize panes on resize
autocmd VimResized * exe 'normal! \<c-w>='
autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
autocmd BufWritePost .vimrc.local source %
" save all files on focus lost, ignoring warnings about untitled buffers
autocmd FocusLost * silent! wa

" make quickfix windows take all the lower section of the screen
" when there are multiple windows open
autocmd FileType qf wincmd J
autocmd FileType qf nmap <buffer> q :q<cr>
augroup END

" Startify Fancy startup screen for vim {{{

" Don't change to directory when selecting a file
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\   { 'uc': [ 'Update CoC Plugins', ':CocUpdate' ] },
\ ]

let g:startify_bookmarks = [
\ { 'c': '~/.config/nvim/init.vim' },
\ { 'g': '~/.gitconfig' },
\ { 'z': '~/.zshrc' }
\ ]

autocmd User Startified setlocal cursorline
nmap <leader>st :Startify<cr>

" Close buffers but keep splits
nmap <leader>b :Bdelete<cr>

" Writing in vim using Goyo Plugin
autocmd! User GoyoEnter nested call helpers#goyo#enter()
autocmd! User GoyoLeave nested call helpers#goyo#leave()

" NERDTree 
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
augroup nerdtree
autocmd!
autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
augroup END

" Toggle NERDTree
function! ToggleNerdTree()
if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
:NERDTreeFind
else
:NERDTreeToggle
endif
endfunction
" toggle nerd tree
nmap <silent> <leader>n :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>

"let g:NERDTreeShowHidden = 1
"let g:NERDTreeMinimalUI = 1
"let g:NERDTreeIgnore = []
"let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
" let NERDTreeDirArrowExpandable = '▷'
" let NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }

let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
" if in a git project, use :GFiles
nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
" otherwise, use :FZF
nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>s :GFiles?<cr>

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
"tab completion
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" For enhanced <CR> experience with coc-pairs checkout :h coc#on_enter()
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" make comments and HTML attributes italic
highlight Comment cterm=italic term=italic gui=italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic
" highlight Type cterm=italic term=italic gui=italic
highlight Normal ctermbg=none

set nocompatible                  " do not preserve compatibility with Vi
set modifiable                    " buffer contents can be modified
set encoding=utf-8                " default character encoding
set autoread                      " detect when a file has been modified externally
""" Spelling
set spelllang=en                  "languages to check for spelling english
set spellsuggest=10               " number of suggestions for correct spelling
set updatetime=500                " time of idleness is milliseconds before saving swapfile
set undolevels=1000               " how many undo levels to keep in memory
set showcmd                       " show command in last line of the screen
set nostartofline                 " keep cursor in the same column when moving between lines
set confirm                       " ask for confirmation when quitting a file that has changes
set hidden                        " hide buffers
set autoindent                    " indent automatically (useful for formatoptions)
set noexpandtab                   " use tabs instead of spaces
set shiftwidth=4                  " needs to be the same as tabstop
set backspace=indent,eol,start    " backspace key should delete indentation, line ends, characters
set whichwrap=s,b                 " which motion keys should jump to the above/below wrapped line
set history=1000                                  " Change history to a 1000
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nobackup
set nowritebackup

set textwidth=72                  " hard wrap at this column
set joinspaces                    " insert two spaces after puncutation marks when joining multiple lines into one
set wildmenu                      " enable tab completion with suggestions when executing commands
set wildmode=list:longest,full    " settings for how to complete matched strings
set nomodeline                    " vim reads the modeline to execute commands for the current file
set modelines=0                   " how many lines to check in the top/bottom of the file. 0=off
set number                        " Set numbers in front of line
" defines how automatic formatting should be done (see :h fo-table)
set formatoptions-=t formatoptions-=o formatoptions+=crqjnl1
filetype plugin on                " load syntax options for different file types
set omnifunc=syntaxcomplete#Complete
"filetype indent off                " do not load indent options for different file types
" Helpers
" " -------
" " abbreviations (try not to use common words)
" iab medate <c-r>=strftime('%Y-%m-%d')<cr>
" iab meweb https://protesilaos.com/
" iab megit https://gitlab.com/protesilaos
" iab medot https://gitlab.com/protesilaos/dotfiles
"
" " Theme settings
" " --------------
"
" syntax enable
"
command! -bang -nargs=* Find call fzf#vim#grep(
\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>.' || true', 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
command! -bang -nargs=? -complete=dir GitFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
function! RipgrepFzf(query, fullscreen)
let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
let initial_command = printf(command_fmt, shellescape(a:query))
let reload_command = printf(command_fmt, '{q}')
let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
""""" PYTHON PEP 8 STANDART AUTO-INDENTATION"""""""""""""""""""""

au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" For FULL STACK DEVELOPMENT"""""""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" coc {{{        Plug 'neoclide/coc.nvim', {'branch': 'release'}

"      let g:coc_global_extensions = [
"     \ 'coc-css',
""     \ 'coc-json',
"     \ 'coc-tsserver',
"     \ 'coc-git',
"     \ 'coc-eslint',
"python with virtualenv support
" py << EOF
" import os
"    import sys
"    if 'VIRTUAL_ENV' in os.environ:
"      project_base_dir = os.environ['VIRTUAL_ENV']
"      activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"      execfile(activate_this, dict(__file__=activate_this))
"      EOF


