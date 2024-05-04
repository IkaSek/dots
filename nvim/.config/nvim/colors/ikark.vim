hi clear
if exists("syntax_on")
  syntax reset
endif

""" IKARKv2
let g:colors_name = "ikark"
hi Normal guifg=#a6a6a6 guibg=#0d041a ctermfg=white ctermbg=black
hi link Delimiter Normal
hi link Operator Normal
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
hi link Statement Keyword
hi String guifg=#821e94
hi Function guifg=#6c18ba
hi Constant guifg=#762691
hi Type guifg=#671ba1
hi link Statement Keyword
hi Identifier guifg=#762691
hi PreProc guifg=#581463
hi NonText guifg=#78104e
hi Comment guifg=#6b6b6b
hi NonText guifg=#8f1460
hi link SpecialChar NonText
hi link Special NonText

" TS
hi TSPunctDelimiter guifg=#a6a6a6
hi TSPunctBracket guifg=#a6a6a6
hi TSPunctParen guifg=#a6a6a6
hi TSPunctBrace guifg=#a6a6a6
hi TSOperator guifg=#a6a6a6

