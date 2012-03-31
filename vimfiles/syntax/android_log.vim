" Vim syntax file
" Language:	Android Log file
" Maintainer:	Fan Hongtao <fanhongtao@gmail.com>
" Last Change:	2012 Apr 01
" Version: 1.0

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" shut case off
syn case ignore

syn match alogVerbose   "^[-0-9.: ]\+ i[ /].\+$"
syn match alogDebug     "^[-0-9.: ]\+ d[ /].\+$"
syn match alogInfo      "^[-0-9.: ]\+ i[ /].\+$"
syn match alogWarn      "^[-0-9.: ]\+ w[ /].\+$"
syn match alogError     "^[-0-9.: ]\+ e[ /].\+$"

" hi alogVerbose gui=NONE guifg=#B5A1FF ctermfg=Blue 

" Define color by syntax default color
" hi def link alogDebug Comment
" hi def link alogInfo Type
" hi def link alogWarn Statement
" hi def link alogError Error

" Define color by user specified color
hi alogDebug gui=NONE guifg=#B5A1FF ctermfg=Blue 
hi alogInfo gui=NONE guifg=Green ctermfg=Green 
hi alogWarn gui=NONE guifg=Yellow ctermfg=Yellow 
hi alogError gui=NONE guifg=Red ctermfg=Red 

let b:current_syntax = "android_log"

