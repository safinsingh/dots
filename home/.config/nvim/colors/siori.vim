""""""""""""
" ORIGINAL "
""""""""""""
" Name:       siori.vim
" Version:    1.0
" Maintainer: github.com/co1ncidence
" License:    The BSD 3 Clause License
"
" Based on
"
"   https://github.com/pbrisbin/vim-colors-off (MIT License)
"
" which in turn based on
"
"   https://github.com/reedes/vim-colors-pencil (MIT License)
"
"""
" Modified by: Safin Singh

hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='siori'

let s:black           = { "gui": "#2e2527", "cterm": "0"   }
let s:medium_gray     = { "gui": "#b9b5b7", "cterm": "243" }
let s:white           = { "gui": "#b9b5b7", "cterm": "15"  }
let s:light_black     = { "gui": "#2e2527", "cterm": "8"   }
let s:lighter_black   = { "gui": "#534347", "cterm": "240" }
let s:subtle_black    = { "gui": "#4f4648", "cterm": "236" }
let s:light_gray      = { "gui": "#625558", "cterm": "249" }
let s:lighter_gray    = { "gui": "#b9b5b7", "cterm": "251" }
let s:lightest_gray   = { "gui": "#cfcbcc", "cterm": "251" }
let s:dark_red        = { "gui": "#9e7878", "cterm": "1"   }
let s:light_red       = { "gui": "#9e8e8e", "cterm": "1"   }
let s:dark_blue       = { "gui": "#76969e", "cterm": "4"   }
let s:light_blue      = { "gui": "#946C66", "cterm": "153" }
let s:dark_cyan       = { "gui": "#9e7878", "cterm": "6"   }
let s:light_cyan      = { "gui": "#76969e", "cterm": "14"  }
let s:dark_green      = { "gui": "#769c8b", "cterm": "2"   }
let s:light_green     = { "gui": "#899a78", "cterm": "10"  }
let s:dark_purple     = { "gui": "#7a889c", "cterm": "5"   }
let s:light_purple    = { "gui": "#8c929c", "cterm": "13"  }
let s:light_yellow    = { "gui": "#9a907a", "cterm": "11"  }
let s:dark_yellow     = { "gui": "#99948a", "cterm": "3"   }

if &background == "dark"
  let s:bg               = s:black
  let s:bg_subtle        = s:light_black
  let s:bg_very_subtle   = s:subtle_black
  let s:norm             = s:lighter_gray
  let s:norm_subtle      = s:medium_gray
  let s:norm_very_subtle = s:medium_gray
  let s:purple           = s:light_purple
  let s:cyan             = s:light_cyan
  let s:green            = s:light_green
  let s:red              = s:light_red
  let s:yellow           = s:light_yellow
  let s:visual           = s:lighter_black
  let s:cursor_line      = s:subtle_black
  let s:constant         = s:light_blue
  let s:comment          = s:light_gray
  let s:selection        = s:dark_yellow
  let s:selection_fg     = s:black
  let s:ok               = s:light_green
  let s:warning          = s:yellow
  let s:error            = s:light_red
else
  let s:bg               = s:white
  let s:bg_subtle        = s:lighter_gray
  let s:bg_very_subtle   = s:light_gray
  let s:norm             = s:light_black
  let s:norm_subtle      = s:lighter_black
  let s:norm_very_subtle = s:medium_gray
  let s:purple           = s:dark_purple
  let s:cyan             = s:dark_cyan
  let s:green            = s:dark_green
  let s:red              = s:dark_red
  let s:yellow           = s:dark_yellow
  let s:visual           = s:light_blue
  let s:cursor_line      = s:lightest_gray
  let s:constant         = s:dark_blue
  let s:comment          = s:light_gray
  let s:selection        = s:light_yellow
  let s:selection_fg     = s:light_black
  let s:ok               = s:light_green
  let s:warning          = s:yellow
  let s:error            = s:dark_red
endif

unlet s:black
unlet s:medium_gray
unlet s:white
unlet s:light_black
unlet s:lighter_black
unlet s:subtle_black
unlet s:light_gray
unlet s:lighter_gray
unlet s:lightest_gray
unlet s:dark_red
unlet s:light_red
unlet s:dark_blue
unlet s:light_blue
unlet s:dark_cyan
unlet s:light_cyan
unlet s:dark_green
unlet s:light_green
unlet s:dark_purple
unlet s:light_purple
unlet s:light_yellow
unlet s:dark_yellow

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" __Normal__
if has("gui")
    call s:h("Normal",    {"fg": s:norm, "bg": s:bg})
    call s:h("Cursor",    {"fg": s:bg, "bg": s:norm})
else
    call s:h("Normal",    {"fg": s:norm})
    hi! link Cursor       Identifier
endif
hi! link Identifier       Normal
hi! link Function         Identifier
hi! link Type             Normal
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type
hi! link Special          Normal
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special
hi! link VertSplit        Normal
hi! link PreProc          Normal
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

" __Operator__
call s:h("Noise",         {"fg": s:norm_subtle, "gui": "NONE"})
hi! link Operator         Noise
hi! link FoldColumn       LineNr
hi! link SignColumn       LineNr

" __Comment__
call s:h("Comment",       {"fg": s:comment, "gui": "NONE"})
hi! link shShebang        Comment

" __Constant__
call s:h("Constant",      {"fg": s:constant})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant
hi! link Directory        Constant
hi! link Title            Constant

" __Statement__
call s:h("Statement",     {"fg": s:norm, "gui": "bold"})
hi! link Include          Statement
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

" __ErrorMsg__
call s:h("ErrorMsg",      {"fg": s:error})
hi! link Error            ErrorMsg
hi! link Question         ErrorMsg
" __WarningMsg__
call s:h("WarningMsg",    {"fg": s:warning})
" __MoreMsg__
call s:h("MoreMsg",       {"fg": s:norm_subtle, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg          MoreMsg

" __NonText__
call s:h("NonText",       {"fg": s:bg})
hi! link qfLineNr         NonText
hi! link NonText          NonText

" __Folded
call s:h("Folded",        {"bg": s:norm_very_subtle, "fg": s:bg})
hi! link Folded           Folded

" __Search__
call s:h("Search",        {"bg": s:selection, "fg": s:selection_fg})
call s:h("IncSearch",     {"bg": s:selection, "fg": s:selection_fg, "gui": "bold"})

" __Visual__
call s:h("Visual",        {"bg": s:visual})
" __VisualNOS__
call s:h("VisualNOS",     {"bg": s:bg_subtle})

call s:h("Ignore",        {"fg": s:bg})

" __DiffAdd__
call s:h("DiffAdd",       {"fg": s:green})
" __DiffDelete__
call s:h("DiffDelete",    {"fg": s:red})
" __DiffChange__
call s:h("DiffChange",    {"fg": s:yellow})
" __DiffText__
call s:h("DiffText",      {"fg": s:constant})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:ok})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:error})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:ok})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:ok})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:error})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:ok})
endif

hi! link helpHyperTextEntry Title
hi! link helpHyperTextJump  String

" __StatusLine__
call s:h("StatusLine",        {"gui": "underline", "bg": s:bg, "fg": s:norm_very_subtle})
" __StatusLineNC__
call s:h("StatusLineNC",      {"gui": "underline", "bg": s:bg, "fg": s:bg_subtle})
" __WildMenu__
call s:h("WildMenu",          {"gui": "underline,bold", "bg": s:bg, "fg": s:norm})

call s:h("StatusLineOk",      {"gui": "underline", "bg": s:bg, "fg": s:ok})
call s:h("StatusLineError",   {"gui": "underline", "bg": s:bg, "fg": s:error})
call s:h("StatusLineWarning", {"gui": "underline", "bg": s:bg, "fg": s:warning})

" __Pmenu__
call s:h("Pmenu",         {"fg": s:norm, "bg": s:cursor_line})
hi! link PmenuSbar        Pmenu
hi! link PmenuThumb       Pmenu
" __PmenuSel__
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:cursor_line, "gui": "bold"})

hi! link TabLine          Normal
hi! link TabLineSel       Keyword
hi! link TabLineFill      Normal

" __CursorLine__
call s:h("CursorLine",    {"bg": s:cursor_line})
call s:h("CursorLineNr",    {"bg": s:bg})

" __LineNr__
call s:h("LineNr",        {"bg": s:bg, "fg": s:bg_subtle})

" __MatchParen__
call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})

hi! link htmlH1 Normal
hi! link htmlH2 Normal
hi! link htmlH3 Normal
hi! link htmlH4 Normal
hi! link htmlH5 Normal
hi! link htmlH6 Normal

hi link diffRemoved       DiffDelete
hi link diffAdded         DiffAdd

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

hi link jsFlowTypeKeyword Statement
hi link jsFlowImportType Statement
hi link jsFunction Statement
hi link jsGlobalObjects Normal
hi link jsGlobalNodeObjects Normal
hi link jsArrowFunction Noise
hi link StorageClass Statement

hi link xmlTag Constant
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlAttrib xmlTag

hi link markdownH1 Statement
hi link markdownH2 Statement
hi link markdownH3 Statement
hi link markdownH4 Statement
hi link markdownH5 Statement
hi link markdownH6 Statement
hi link markdownListMarker Constant
hi link markdownCode Constant
hi link markdownCodeBlock Constant
hi link markdownCodeDelimiter Constant
hi link markdownHeadingDelimiter Constant

hi link yamlBlockMappingKey Statement
hi link pythonOperator Statement

hi link ALEWarning WarningMsg
hi link ALEWarningSign WarningMsg
hi link ALEError ErrorMsg
hi link ALEErrorSign ErrorMsg
hi link ALEInfo InfoMsg
hi link ALEInfoSign InfoMsg

hi link sqlStatement Statement
hi link sqlKeyword Keyword
