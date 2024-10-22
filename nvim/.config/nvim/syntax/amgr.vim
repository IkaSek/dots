syntax clear

syntax keyword amgr_FORMAT format
syntax keyword amgr_BEGIN begin
syntax keyword amgr_END end
syntax match amgr_COMMENT "#.*"
syntax match amgr_STRING '"[^"\\]*\|""'
syntax match amgr_PREPROC "@[a-zA-Z_-][a-zA-Z0-9_-]*"
syntax match amgr_VAR "[a-zA-Z_]*\s*:" containedin=amgr_BEGIN

"syntax region amgr_context start="\@ASSET-MANAGER" end="# ASSET-MANAGER"

hi link amgr_PREPROC PreProc
hi link amgr_FORMAT Constant
hi link amgr_BEGIN Keyword
hi link amgr_END Keyword
hi link amgr_COMMENT Comment
hi link amgr_STRING String
hi link amgr_VAR Constant

autocmd BufNewFile,BufRead *.amg setlocal filetype=asset-manager
