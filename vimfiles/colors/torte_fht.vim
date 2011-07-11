" Vim color file
" Maintainer:    Thorsten Maerz <info@netztorte.de>
" Last Change:    2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "torte_fht"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80   guibg=Black
highlight Search     guifg=Black    guibg=Red       gui=bold
highlight Visual     guifg=#404040                  gui=bold
highlight Cursor     guifg=Black    guibg=Green     gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue     guibg=white
highlight Statement  guifg=Yellow                   gui=NONE
highlight Type                                      gui=NONE
highlight Pmenu                     guibg=Blue
highlight ModeMsg    guifg=Green                    gui=NONE

" Console
highlight Normal     ctermfg=LightGrey  ctermbg=Black
highlight Search     ctermfg=Black      ctermbg=Red     cterm=NONE
highlight Visual                        cterm=reverse
highlight Cursor     ctermfg=Black      ctermbg=Green   cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue       ctermbg=white
highlight Statement  ctermfg=Yellow                     cterm=NONE
highlight Type                                          cterm=NONE
highlight Pmenu                         ctermbg=Blue
highlight ModeMsg    ctermfg=Green                      cterm=NONE


