if exists('b:current_syntax')
  finish
endif

let b:current_syntax = 'gbasm'

if get(g:, 'flog_use_ansi_esc')
  finish
endif

syntax match gbsymLocation /^\x\x:\x\{4}\(:[^ ]\+\)\?\>/
syntax match gbsymBank contained containedin=gbsymLocation /^\x\x\>/
syntax match gbsymLocationDivider contained containedin=gbsymLocation /:/
syntax match gbsymAddress contained containedin=gbsymLocation /\<\x\{4}\>/
syntax match gbsymLocationOptions contained containedin=gbsymLocation /\x*[._\-=,g-zG-Z][._\-=,a-zA-Z0-9]*/

highlight default link gbsymLocation Normal
highlight default link gbsymBank Statement
highlight default link gbsymLocationDivider gbsymLocation
highlight default link gbsymAddress Statement
highlight default link gbsymLocationOptions Special

syntax match gbsymComment /^;.*/
syntax match gbsymCommentOpener contained containedin=gbsymComment nextgroup=gbsymCommentSpace /^;\+/
syntax match gbsymCommentSpace contained nextgroup=gbsymCommentText /\s*/
syntax match gbsymCommentText contained /.*/

highlight default link gbsymComment Comment
highlight default link gbsymCommentOpener Comment
highlight default link gbsymCommentText Comment

syntax match gbsymSpecialComment /^;;.*/
syntax match gbsymSpecialCommentOpener contained containedin=gbsymSpecialComment nextgroup=gbsymSpecialCommentSpace /^;\+/
syntax match gbsymSpecialCommentSpace contained nextgroup=gbsymSpecialCommentLocation,gbsymSpecialCommentText /\s*/
syntax match gbsymSpecialCommentText contained /.*/

highlight default link gbsymSpecialComment gbsymComment
highlight default link gbsymSpecialCommentOpener gbsymCommentOpener
highlight default link gbsymSpecialCommentText gbsymSpecialComment

syntax match gbsymSpecialCommentLocation contained nextgroup=gbsymSpecialCommentText /\x\x:\x\{4}\(:[^ ]\+\)\?\>/
syntax match gbsymSpecialCommentBank contained containedin=gbsymSpecialCommentLocation /\<\x\x\>/
syntax match gbsymSpecialCommentLocationDivider contained containedin=gbsymSpecialCommentLocation /:/
syntax match gbsymSpecialCommentAddress contained containedin=gbsymSpecialCommentLocation /\<\x\{4}\>/
syntax match gbsymSpecialCommentLocationOptions contained containedin=gbsymSpecialCommentLocation /\x*[._\-=,g-zG-Z][._\-=,a-zA-Z0-9]*/

highlight default link gbsymSpecialCommentLocation gbsymSpecialComment
highlight default link gbsymSpecialCommentBank String
highlight default link gbsymSpecialCommentLocationDivider gbsymSpecialCommentLocation
highlight default link gbsymSpecialCommentAddress String
highlight default link gbsymSpecialCommentLocationOptions String
