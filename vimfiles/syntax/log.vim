" Vim syntax file
" Language:	(Android) Log file
" Maintainer:	Fan Hongtao <fanhongtao@gmail.com>
" Last Change:	2012 Apr 09
" Version: 1.0 2012-04-01
"          1.1 2012-04-09 support all Android logcat type except 'long'

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" shut case off
syn case ignore

syn match alogVerbose   "^[-0-9.: ]\+ v[ /].\+$\|^v/.\+$\|^v( [0-9:a-z]\+) .\+$"
syn match alogDebug     "^[-0-9.: ]\+ d[ /].\+$\|^d/.\+$\|^d( [0-9:a-z]\+) .\+$"
syn match alogInfo      "^[-0-9.: ]\+ i[ /].\+$\|^i/.\+$\|^i( [0-9:a-z]\+) .\+$"
syn match alogWarn      "^[-0-9.: ]\+ w[ /].\+$\|^w/.\+$\|^w( [0-9:a-z]\+) .\+$"
syn match alogError     "^[-0-9.: ]\+ e[ /].\+$\|^e/.\+$\|^e( [0-9:a-z]\+) .\+$"

" hi alogVerbose gui=NONE guifg=#B5A1FF ctermfg=Blue 

" Define color by syntax default color
" hi def link alogDebug Comment
" hi def link alogInfo Type
" hi def link alogWarn Statement
" hi def link alogError Error

" Define color by user specified color
hi alogDebug gui=NONE guifg=#B5A1FF ctermfg=Blue 
hi alogInfo gui=NONE guifg=#007F00 ctermfg=Green 
hi alogWarn gui=NONE guifg=#FF7F00 ctermfg=Yellow 
hi alogError gui=NONE guifg=#FF0000 ctermfg=Red 

let b:current_syntax = "log"

