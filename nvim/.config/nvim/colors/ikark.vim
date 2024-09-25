hi clear
syntax reset
colorscheme default

""" IKARKv2
hi Normal guifg=#a6a6a6 guibg=#0d041a 
" not linking those somehow fixes #1?
hi Delimiter guifg=#a6a6a6 guibg=#0d041a
hi Operator guifg=#a6a6a6 guibg=#0d041a
"
hi LineNr guifg=#6b6b6b guibg=#0d041a
hi Cursor guifg=#2e2e2e
hi CursorLine guibg=#311b4d
hi Visual guibg=#322d38
hi VisualNOS guibg=#322d38
hi Pmenu guibg=#0d041a gui=bold
hi PmenuSel guibg=#290e4f
hi TabLine guifg=#a6a6a6 guibg=#28104a
hi TabLineFill guifg=#a6a6a6 guibg=#3e1f69

hi Keyword guifg=#7b0f99 gui=bold
hi Statement guifg=#97219c gui=bold
hi String guifg=#821e94
hi Function guifg=#6c18ba
hi Constant guifg=#762691
hi Type guifg=#671ba1
hi Identifier guifg=#762691
hi Variable guifg=#871591
" this too?
hi @variable guifg=#871591
"
hi @text.todo guifg=#66293a guibg=#3b121d
hi Todo guifg=#66293a guibg=#3b121d
hi PreProc guifg=#581463
hi NonText guifg=#78104e
hi Comment guifg=#6b6b6b
hi NonText guifg=#8f1460
hi link SpecialChar NonText
hi Special guifg=#8f1460 
hi link @constructor Type
hi @function.builtin guifg=#582c85 gui=bold
hi link @constant.builtin Constant
hi link @keyword.modifier Keyword
hi link @delimiter Delimiter
hi link @operator Operator
hi link @lsp.type.errorTag.zig Identifier

hi Branch guifg=#a313f0 guibg=#3c114e
hi Filename guifg=#ac18cd guibg=#400661
" TODO: time
" hi Time
hi File guifg=#ac18cd guibg=#400661
hi Progress guifg=#a313f0 guibg=#3c114e

hi Title guifg=#330b8a guibg=#0d041a gui=bold

hi Directory guifg=#540f80 gui=bold
hi link NvimTreeFolderIcon Directory

hi SpellCap guifg=#b50d9c gui=bold

" https://neovim.io/doc/user/news-0.10.html
hi link NormalFloat Pmenu
hi StatusLine guifg=#a6a6a6 guibg=#000000
