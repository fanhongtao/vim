" Fan Hongtao's vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"==============================================================================
" plugin: pathogen (id: 2332)
" When install plugin with directory 'doc', execute command like this to make
" the doc effective:
"	helptag $VIM/vimfiles/bundle/Recent/doc
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
"call pathogen#helptags()
call pathogen#runtime_append_all_bundles()      " Init plugin pathogen


"==============================================================================
" Quickly edit/reload the vimrc file
let mapleader=","           " change leader from '\' to ','
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Detect OS
if (has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

"==============================================================================
" Some basic settings. Use command ':help options' for more information
set backspace=indent,eol,start
                        " allow backspacing over everything in insert mode
set expandtab           " use spaces instead of tab
set tabstop=4           " a tab is four spaces
set softtabstop=4       " replace tab with 4 spaces
set shiftwidth =4       " auto indent with 4 spaces
set fileencodings=utf-8,ucs-bom,cp936
                        " a list of character encodings considered when 
                        " starting to edit an existing file.
set history=50          " keep 50 lines of command line history
set undolevels=1000     " use many muchos levels of undo 
set number              " Print the line number in front of each line
set ruler               " Show the line and column number of the cursor position
set showcmd             " display incomplete commands
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        "    case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to
                        "    shiftwidth, not tabstop
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type

set visualbell          " don't beep
set noerrorbells        " don't beep
set nobackup            " do not keep a backup file
set noswapfile          " do not use swap file

" Set the spell language to US English.
" Use Ctrl-X, CTRL-K to check the spell
"set spell spelllang=en_us

if (g:iswindows==1)
    au GUIEnter * simalt ~x             " Maximize windows when start.
                                        " :h gui-win32-maximized
    set dir=d:/temp/vimswap,d:/temp,.   " set directory of swap files
else
    set dir=/tmp/vimswap,/tmp/,.        " set directory of swap files
endif


if &t_Co >= 256 || has("gui_running")
    colorscheme torte       " set active color scheme
endif


" It clears the search buffer when you press ,/
nmap <silent> ,/ :nohlsearch<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 120 characters.
        autocmd FileType text setlocal textwidth=120

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

    " Set file type specific settings.
    autocmd filetype python set expandtab

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"==============================================================================
" read project's setting file
let s:backup_dir = getcwd()
let s:curr_dir = s:backup_dir
let s:last_dir = ""
while s:last_dir != s:curr_dir
    if filereadable("vim_proj/project.vim")
        echo 'Read project from '.s:curr_dir
        source vim_proj/project.vim
    endif
    cd ..
    let s:last_dir = s:curr_dir
    let s:curr_dir = getcwd()
endwhile
execute ":cd ".s:backup_dir
unlet s:backup_dir
unlet s:curr_dir
unlet s:last_dir

"==============================================================================
" User defined command
function s:Thelp(param)
    :tabnew
    :exec ":help" a:param
    :only!
endfunction

if !exists(":Myhelp")
    command -nargs=1 Myhelp call s:Thelp("<args>")
endif

if !exists(":Thelp")
    command -nargs=1 Thelp :tabnew | :exec "help" "<args>" | :only!
endif


"==============================================================================
" Plugin settings.

"==============================================================================
" plugin: matchit (id: 39)
filetype plugin on

"==============================================================================
" plugin: mwinmanager (id: 95)
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>

"==============================================================================
" plugin: ShowMarks (id: 152)
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

let showmarks_hlline_lower=1
let showmarks_hlline_upper=1

highlight ShowMarksHLl ctermbg=Yellow  ctermfg=Black guibg=#FFDB72 guifg=Black
highlight ShowMarksHLu ctermbg=Magenta ctermfg=Black guibg=#FFB3FF guifg=Black

"==============================================================================
" plugin: mminibufexpl (id: 159)
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1

"==============================================================================
" plugin: taglists (id: 273)
let Tlist_Show_One_File    = 1  " Only show tag of current file
let Tlist_Exit_OnlyWindow  = 1  " Exit VIM if taglist window is the one one
let Tlist_Use_Right_Window = 1  " Show taglist window on the right
" Specific setting for C++ file.
" There is no prototype in the default setting.
let tlist_cpp_setting='c++;c:class;f:function;p:prototype'
" Use 'F9' to open/close taglist window
map <silent> <F9> :TlistToggle<CR>

"==============================================================================
" plugin: fencview (id: 1708)
let g:fencview_autodetect = 1

"==============================================================================
" plugin: recent (id: 1767)
let g:RecentWinmode = "newtab"      " Open file in new tab



