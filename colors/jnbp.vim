" vim:et:sw=2:sts=2:ts=2:
"         _            _
"   _ __ | |__  _ __  (_)
"  | '_ \| '_ \| '_ \ | |
"  | |_) | |_) | | | || |
"  | .__/|_.__/|_| |_|/ |
"  |_|              |__/
"
" Author:      Peter Benjamin
" Description: Black & white colorscheme

" :help cterm-colors

" NR-16 NR-8 COLOR-NAME
" 0     0    Black
" 1     4    DarkBlue
" 2     2    DarkGreen
" 3     6    DarkCyan
" 4     1    DarkRed
" 5     5    DarkMagenta
" 6     3    Brown,     DarkYellow
" 7     7    LightGray, LightGrey, Gray, Grey
" 8     0*   DarkGray,  DarkGrey
" 9     4*   Blue,      LightBlue
" 10    2*   Green,     LightGreen
" 11    6*   Cyan,      LightCyan
" 12    1*   Red,       LightRed
" 13    5*   Magenta,   LightMagenta
" 14    3*   Yellow,    LightYellow
" 15    7*   White

hi clear
if exists("g:syntax_on") | syntax reset | endif
let g:colors_name='jnbp'

hi!  Normal      NONE
hi!  SignColumn  NONE
hi!  SpecialKey  NONE
hi!  VertSplit   NONE
hi!  Visual      NONE

hi!  ColorColumn   cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  Comment       cterm=italic                  ctermfg=darkgray    ctermbg=NONE
hi!  Constant      cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  CurSearch     cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  CursorColumn  cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  DiffAdd       cterm=bold                    ctermfg=darkgreen   ctermbg=NONE
hi!  DiffChange    cterm=bold                    ctermfg=darkyellow  ctermbg=NONE
hi!  DiffDelete    cterm=bold                    ctermfg=darkred     ctermbg=NONE
hi!  DiffText      cterm=bold                    ctermfg=brown       ctermbg=NONE
hi!  Directory     cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  Error         cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  ErrorMsg      cterm=bold                    ctermfg=darkred     ctermbg=NONE
hi!  FoldColumn    cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  Folded        cterm=italic                  ctermfg=NONE        ctermbg=NONE
hi!  Identifier    cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  Ignore        cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  LineNr        cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  MatchParen    cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  ModeMsg       cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  MoreMsg       cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  NonText       cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  Pmenu         cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  PmenuMatch    cterm=reverse,bold,underline  ctermfg=NONE        ctermbg=NONE
hi!  PmenuSel      cterm=reverse,bold,underline  ctermfg=NONE        ctermbg=NONE
hi!  PreProc       cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  Question      cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  Search        cterm=underline               ctermfg=NONE        ctermbg=NONE
hi!  Special       cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  SpellBad      cterm=underline               ctermfg=NONE        ctermbg=NONE
hi!  SpellCap      cterm=underline               ctermfg=NONE        ctermbg=NONE
hi!  SpellLocal    cterm=underline               ctermfg=NONE        ctermbg=NONE
hi!  SpellRare     cterm=underline               ctermfg=NONE        ctermbg=NONE
hi!  Statement     cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  StatusLine    cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  StatusLineNC  cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  TabLine       cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  TabLineSel    cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  Title         cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  Todo          cterm=bold                    ctermfg=NONE        ctermbg=NONE
hi!  Type          cterm=NONE                    ctermfg=NONE        ctermbg=NONE
hi!  Underlined    ctermfg=NONE                  ctermbg=NONE        cterm=underline
hi!  Visual        cterm=reverse                 ctermfg=NONE        ctermbg=NONE
hi!  WarningMsg    cterm=bold                    ctermfg=NONE        ctermbg=NONE

" TODO: should these default highlights be overridden?
" hi StatusLine
" hi Conceal
" hi CursorLine
" hi CursorLineNr
" hi FoldColumn
" hi LineNrAbove
" hi LineNrBelow
" hi ToolbarButton
" hi ToolbarLine
" hi VisualNOS
" hi WildMenu
" hi debugBreakpoint
" hi debugPC
" hi diffSubname

hi!  link  Added                 DiffAdd
hi!  link  Changed               DiffChange
hi!  link  Character             Constant
hi!  link  Debug                 Special
hi!  link  EndOfBuffer           NonText
hi!  link  IncSearch             Search
hi!  link  MessageWindow         Pmenu
hi!  link  PmenuExtra            Pmenu
hi!  link  PmenuExtraSel         PmenuSel
hi!  link  PmenuKind             Pmenu
hi!  link  PmenuKindSel          PmenuSel
hi!  link  PmenuSBar             Pmenu
hi!  link  PmenuThumb            Pmenu
hi!  link  PopupNotification     Todo
hi!  link  QuickFixLine          Error
hi!  link  Removed               DiffDelete
hi!  link  SpecialKey            NonText
hi!  link  StatuslineTerm        Statusline
hi!  link  StatuslineTermNC      StatuslineNC
hi!  link  TabLineFill           TabLine
hi!  link  Terminal              Normal
hi!  link  Terminal              Normal
hi!  link  diffAdded             DiffAdd
hi!  link  diffChanged           DiffChange
hi!  link  diffRemoved           DiffDelete
hi!  link  gitCommitSummary      Title
hi!  link  javaScriptFunction    Statement
hi!  link  javaScriptIdentifier  Statement
hi!  link  markdownUrl           String
hi!  link  rubyDefine            Statement
hi!  link  rubyMacro             Statement
hi!  link  sqlKeyword            Statement
hi!  link  vimCommentString      Comment
hi!  link  vimOper               Normal
hi!  link  vimParenSep           Normal
hi!  link  vimSep                Normal
hi!  link  vimVar                Normal
hi!  link  yamlBlockMappingKey   Statement
