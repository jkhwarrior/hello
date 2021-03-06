  set autoread                                                                " Set to auto read when a file is changed from the outside
  set backspace=indent,eol,start                                              " more powerful backspacing
  "set clipboard=unnamed                                                       " access your system clipboard
  "Use clipboard register
  if has ('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif

  set cmdheight=2                                                             " Height of the command bar
  set pastetoggle=<F12>                                                       " Paste mode toggle
  syntax enable                                                               " enable syntax highlighting and plugin (for netrw)
  set encoding=utf8                                                           " Set utf8 as standard encoding and en_US as the standard language
  set expandtab                                                               " convert tabs into spaces
  set ffs=unix,dos,mac                                                        " Use Unix as the standard file type
  set foldmethod=indent                                                       " Code folding
  set foldlevel=99
  set autoindent smartindent
  set history=500                                                             " Sets how many lines of history VIM has to remember
  set incsearch                                                               " incremental search
  set laststatus=2                                                            " Always show the status line
  set list                                                                    " Show trailing white space
  set listchars=tab:>·,trail:~,extends:>,precedes:<,space:.                   " eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
  set mouse=nicr
  set magic                                                                   " For regular expressions turn magic on
  set nocompatible                                                            " enter the current millenium
  set number relativenumber                                                   " Show number and relativenumber 
  set hidden
  set ruler                                                                   " Always show current position
  set scrolloff=7                                                             " when scrolling, keep cursor 3 lines away from screen border
  set shiftwidth=2                                                            " amount of block indenting
  set smarttab                                                                " uses the shiftwidth instead of tabstop to delete indented line
  set synmaxcol=200                                                           " performance ???
  set tabstop=2                                                               " press tab, 2 spaces forward, 1 tab == 2 spaces
  set wrap                                                                    " Wrap lines
  set shortmess=aTi                                                           " Do not display greeting message at vim startup
  set infercase                                                               " Ignore case on insert completion
  filetype plugin indent on
  let mapleader = ","
  let maplocalleader = ","
  set termguicolors
  " Toggle line numbers
  nnoremap <leader>N :setlocal number!<CR> 

  " comma+s to save, comma+q to quit (does not save!), quit all without saving
  nnoremap <leader>ss :w<CR>
  nnoremap <leader>q :q!<CR>
  nnoremap <leader>qa :qa!<CR>

  let $MYVIMRC="/home/debian/.vimrc"
  " Reload vimrc
  nnoremap <leader>rv :source<Space>$MYVIMRC<CR>
  " Edit vimrc
  nnoremap <leader>ev :tabnew $MYVIMRC<CR>

  " Copy & paste to clipboard
  noremap <Leader>Y "+y
  noremap <Leader>P "+p

  " Display a buffer displaying the yankring contents 
  nnoremap <silent> <F11> :YRShow<CR>
  let g:yankring_max_history = 100 

  " change Escape key behaviour
  imap <leader>q <Esc>
  inoremap jj <Esc>

  " Enable folding with the z
  nnoremap <leader> z

  " Buffer key mappings
  nnoremap <leader>l :bn<CR>
  nnoremap <leader>h :bp<CR>
  nnoremap <leader>0 :bf<CR>
  nnoremap <leader>9 :bl<CR>
  nnoremap <leader>dd :bd<CR>

  " Managing tabs
  nnoremap tn :tabnew<Space>
  nnoremap tk :tabnext<CR>
  nnoremap tj :tabprev<CR>
  nnoremap th :tabfirst<CR>
  nnoremap tl :tablast<CR>
  nnoremap tc :tabclose<CR>

  " :W sudo saves the file
  " (useful for handling the permission-denied error)
  command W w !sudo tee % > /dev/null

  " navigate split screens easily
  nmap <silent> <c-k> :wincmd k<CR>
  nmap <silent> <c-j> :wincmd j<CR>
  nmap <silent> <c-h> :wincmd h<CR>
  nmap <silent> <c-l> :wincmd l<CR>

  " Pressing Shift < or Shift > will let you indent/unident selected lines
  vnoremap < <gv
  vnoremap > >gv

  " comma-1 insert "!" commenting
  nnoremap <leader>1 :norm i!<CR>
  vnoremap <leader>1 :norm i!<CR>

  " comma-' insert """ commenting
  nnoremap <leader>' :norm i"<CR>
  vnoremap <leader>' :norm i"<CR>

  " comma-3 insert "#" commenting
  nnoremap <leader>3 :norm i#<CR>
  vnoremap <leader>3 :norm i#<CR>

  " comma-- insert "--" commenting
  nnoremap <leader>- :norm i--<CR>
  vnoremap <leader>- :norm i--<CR>

  " comma-6 uncomment
  nnoremap <leader>6 :norm ^x<CR>
  vnoremap <leader>6 :norm ^x<CR>

  " Make Y yank everything from the cursor to the end of the line. This makes Y
  " act more like C or D because by default, Y yanks the current line (i.e. the
  " same as yy).
  noremap Y y$
   " Ignore compiled files
  set wildignore=*.o,*~,*.pyc
  if has("win16") || has("win32")
      set wildignore+=.git\*,.hg\*,.svn\*
  else
      set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
  endif

  " autocompletion of files and commands behaves like shell
  " (complete only the common part, list the options that match)
  set wildmode=list:longest

  " FINDING FILES: **********************************************************
  " search down into subfolders
  " provides tab-completion for all file-related tasks
  set path+=**

  " display all matching files when we tab complete
   set nowildmenu
   set wildmode=list:longest,full
   set lazyredraw
   set ttyfast
   set wildoptions=tagfile
   set showfulltag
   set completeopt=menu
   set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t  " Scan files given by directory options "

  " NOW WE CAN:
  " - hit tab to :find by partial match
  " - use * to make it fuzzy
  " THINGS TO CONSIDER:
  " - :b lets you autocomplete any open buffer
  " END FINDING FILES: **********************************************************

  " FILE BROWSING: *********************************************************
  " tweaks for browsing
   let g:netrw_banner=0                                    " disable annoying banner
   let g:netrw_browse_split=4                              " open in prior window
   let g:netrw_altv=1                                      " open splits to the right
   let g:netrw_liststyle=3                                 " tree view
   let g:netrw_list_hide=netrw_gitignore#Hide()
   let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
   let g:netrw_winsize=20 
   let g:netrw_localrmdir='rm -r'
   " toggle netrw on the left side of the editor
   nnoremap <leader>n :Lexplore<CR>

  " NOW WE CAN:
  " - :edit a folder to open a file browser
  " - <CR>/v/t to open in an h-split/v-split/tCRab
  " - check |netrw-browse-maps| for more mappings
  " END FILE BROWSING: *********************************************************

  " Enable 256 colors palette in Gnome Terminal
  if $COLORTERM == 'gnome-terminal'
      set t_Co=256
  endif

  set background=dark

  " Set extra options when running in GUI mode
  if has("gui_running")
      set guioptions-=T
      set guioptions-=e
      set t_Co=256
      set guitablabel=%M\ %t
      set cursorcolumn!

      " Set up the gui cursor to look nice
      set guicursor=n-v-c:block-Cursor-blinkon0
      set guicursor+=ve:ver35-Cursor
      set guicursor+=o:hor50-Cursor
      set guicursor+=i-ci:ver25-Cursor
      set guicursor+=r-cr:hor20-Cursor
      set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
  endif

  " better backup, swap and undos storage
  set directory=~/.vim/dirs/tmp     " directory to place swap files in
  set backup                        " make backup files
  set backupdir=~/.vim/dirs/backups " where to put backup files
  set undofile                      " persistent undos - undo after you re-open the file
  set undodir=~/.vim/dirs/undos
  set viminfo+=n~/.vim/dirs/viminfo

  " create needed directories if they don't exist
  if !isdirectory(&backupdir)
      call mkdir(&backupdir, "p")
  endif
  if !isdirectory(&directory)
      call mkdir(&directory, "p")
  endif
  if !isdirectory(&undodir)
      call mkdir(&undodir, "p")
  endif
  
" PLUGINS
  " ************************************************************************
  " set the runtime path to include VUndle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  set rtp+=~/.vim/bundle/Vundle
  set rtp+=~/.vim/bundle/vundle
  call vundle#begin()
  " plugins "
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  Plugin 'flazz/vim-colorschemes'
  Plugin 'elzr/vim-json'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'airblade/vim-gitgutter'

  " Icon files
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'ryanoasis/vim-devicons'
  " Airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " theme plugins
  Plugin 'nightsense/office'
  Plugin 'fatih/molokai'
  Plugin 'nightsense/cosmic_latte'
  Plugin 'ErichDonGubler/vim-sublime-monokai'
  Plugin 'Nequo/vim-allomancer'
  Plugin 'neoclide/coc.nvim'
  " All of your Plugins must be added before the following line

  try
    " Choose colorscheme
    " *********************************************
    if strftime('%H') >= 7 && strftime('%H') < 20
        colorscheme sublimemonokai
    else
        " colorscheme office-dark
        colorscheme allomancer
        let g:airline_theme='cosmic_latte_dark'
    endif
  catch
  endtry

  Plugin 'scrooloose/nerdtree'                    " Better file browser
  Plugin 'scrooloose/nerdcommenter'               " Code commenter
  Plugin 'majutsushi/tagbar'                      " Class/module browser
  Plugin 'ctrlpvim/ctrlp.vim'                     " Code and files fuzzy finder
  Plugin 'mattn/emmet-vim'                        " emmet, you know what it is
  Plugin 'kien/tabman.vim'                        " Tab list panel
  Plugin 'ervandew/supertab'                      " Use <TAB> for all your insert completion needs 
  Plugin 'Townk/vim-autoclose'                    " Autoclose chars
  Plugin 'fisadev/dragvisuals.vim'                " Drag visual blocks arround (it is like Ctrl+d arrow up/down on sublime)
  Plugin 't9md/vim-choosewin'                     " Land on window like tmux's 'display-pane'
  Plugin 'tpope/vim-fugitive'                     " Git integration
  Plugin 'google/vim-searchindex'                 " display number of search matches & index of a current match
  Plugin 'ap/vim-css-color'                       " Paint css colors with the real color
  Plugin 'tpope/vim-surround'                     " Surround
  Plugin 'vim-scripts/matchit.zip'                " XML/HTML tags navigation
  Plugin 'vim-scripts/YankRing.vim'               " Yank history navigation
  Plugin 'pangloss/vim-javascript'                " Javascript indentation and syntax support
  Plugin 'w0rp/ale'                               " Check syntax in Vim asynchronously and fix files
  Plugin 'MaxMEllon/vim-jsx-pretty'               " JSX syntax pretty highlighting
  Plugin 'styled-components/vim-styled-components'

  call vundle#end()

   " PLUGINS SETUP
  " ********************************************************************************

  " NERDTree -----------------------------
  map <F5> :NERDTreeToggle<CR>
  let g:NERDTreeDirArrowExpandable = '▸'" Prettier
  " open nerdtree with the current file selected
  nmap <leader>t :NERDTreeFind<CR>
  let g:NERDTreeDirArrowCollapsible = '▾'
  let g:NERDTreeMouseMode = 3
  let NERDTreeShowLineNumbers = 1
  let NERDTreeShowHidden = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeIgnore=['\.pyc$', '\~$']         "ignore files in NERDTree

  " Tagbar -----------------------------
  " toggle tagbar display
  map <F8> :TagbarToggle<CR>
  " autofocus on tagbar open
  let g:tagbar_autofocus = 1

  " Airline -----------------------------
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'distinguished'
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0
  let g:Powerline_symbols = "fancy"
  let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
  let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}

  " to use fancy symbols for airline
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " Airline unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_right_sep = '«'
  let g:airline_left_alt_sep = ''
  let g:airline_right_alt_sep = ''

  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'

  " vim-gitgutter to set report focus 
  let g:gitgutter_terminal_reports_focus=0

  " CtrlP -----------------------------
  " file finder mapping
  let g:ctrlp_map = '<leader>ee'
  " tags (symbols) in current file finder mapping
  nmap <leader>g :CtrlPBufTag<CR>
  " tags (symbols) in all files finder mapping
  nmap <leader>G :CtrlPBufTagAll<CR>
  " general code finder in all files mapping
  nmap <leader>f :CtrlPLine<CR>
  " recent files finder mapping
  nmap <leader>m :CtrlPMRUFiles<CR>
  " commands finder mapping
  nmap <leader>c :CtrlPCmdPalette<CR>
  " to be able to call CtrlP with default search text
  function! CtrlPWithSearchText(search_text, ctrlp_command_end)
      execute ':CtrlP' . a:ctrlp_command_end
      call feedkeys(a:search_text)
  endfunction
  " same as previous mappings, but calling with current word as default text
  nmap <leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
  nmap <leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
  nmap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
  nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
  nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
  nmap <leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
  nmap <leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
  " don't change working directory
  let g:ctrlp_working_path_mode = 0
  " ignore these files and folders on file finder
  let g:ctrlp_custom_ignore = {
              \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|vendor)$',
              \ 'file': '\.pyc$\|\.pyo$\|\.sh$\|\.so$',
              \ }

  " vim emmet trigger key, prest ctrl + e + comma -----------------------------
  let g:user_emmet_leader_key='<C-E>'
  " 
  " Vim-Supertab Configuration
  let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

  " TabMan ------------------------------
  " mappings to toggle display, and to focus on it
  let g:tabman_toggle = 'tl'
  let g:tabman_focus  = 'tf'
  " Change the width of the TabMan window
  " let g:tabman_width = 25
  " Set this to 1 to show windows created by plugins, help and quickfix
  " let g:tabman_specials = 0
  " Set this to 0 to disable line numbering in the TabMan window
  " let g:tabman_number = 1
  "

  " When completion menu is shown, use <CR> to select an item
  " and do not add an annoying newline. Otherwise, <enter> is what it is
  inoremap <expr> <CR> ((pumvisible()?("\<C-Y>"):("\<CR>")))
  " Use <ESC> to close auto-completion menu 
"  inoremap <expr> <ESC> ((pumvisible()?("\<C-e>"):("\<ESC>")))
  " Use <TAB> to navigate down the completion menu
  inoremap <expr> <TAB> pumvisible()?"\<C-n>":"\<TAB>"

  " Autoclose ------------------------------
  " Fix to let ESC work as espected with Autoclose plugin
  let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
  """""""""""""""""""""""""""""""""""""""""""""
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
  autocmd FileType c setlocal omnifunc=ccomplete#Complete
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

  " Toggle spell checking
  nnoremap <silent> <F9> :set spell!<CR>
  inoremap <silent> <F9> <C-O>:set spell!<CR>

  " Use Esc to quit builtin terminal
  if exists('tnoremap')
    tnoremap <ESC> <C-\><C-n>
  endif

  
  " DragVisuals ------------------------------
  " mappings to move blocks in 4 directions
  vmap <expr> <S-M-LEFT> DVB_Drag('left')
  vmap <expr> <S-M-RIGHT> DVB_Drag('right')
  vmap <expr> <S-M-DOWN> DVB_Drag('down')
  vmap <expr> <S-M-UP> DVB_Drag('up')
  " mapping to duplicate block
  vmap <expr> D DVB_Duplicate()

  " choosewin  ------------------------------
  " mapping
  nmap  -  <Plug>(choosewin)
  " show big letters
  let g:choosewin_overlay_enable = 1

  " vim-javascript --------------------------
  " set conceallevel=1
  map <leader>co :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
  let g:javascript_conceal_function             = "ƒ"
  let g:javascript_conceal_null                 = "ø"
  let g:javascript_conceal_this                 = "@"
  let g:javascript_conceal_return               = "⇚"
  let g:javascript_conceal_undefined            = "¿"
  let g:javascript_conceal_NaN                  = "ℕ"
  let g:javascript_conceal_prototype            = "¶"
  let g:javascript_conceal_static               = "•"
  let g:javascript_conceal_super                = "Ω"
  let g:javascript_conceal_arrow_function       = "⇒"
  let g:javascript_conceal_noarg_arrow_function = "🞅"
  let g:javascript_conceal_underscore_arrow_function = "🞅"

  " ALE (eslint)  -------------------------
  map <C-t> :ALEDetail<CR>
  let g:ale_fix_on_save = 1
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'
  let g:ale_open_list = 1
  let g:ale_set_loclist = 0
  let g:ale_lint_on_enter = 0
  let g:ale_set_quickfix = 1
  let g:ale_keep_list_window_open = 0
  let g:ale_lint_delay = 960000                 " 16 minutes
  let g:ale_lint_on_text_changed= "never"
  let g:ale_list_window_size = 5                " Show 5 lines of errors (default: 10)
  nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
  nmap <silent> <Leader>j <Plug>(ale_next_wrap)
  let g:ale_linters = {
    \  'sh': ['shell'],
    \  'javascript': ['eslint'],
    \}
  let g:ale_fixers = {
    \  'sh': ['shfmt'],
    \  'javascript': ['prettier', 'eslint'],
    \  'json': ['prettier'],
    \  'markdown': ['prettier'],
    \  'yaml': ['prettier'],
    \  'css': ['prettier'],
    \}

  " vim jsx pretty -----------------------
  let g:vim_jsx_pretty_colorful_config = 1

  let g:coc_node_path = '/usr/bin/node'

