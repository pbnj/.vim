" vim:noet:sw=2:sts=2:ts=2:
"         _            _
"   _ __ | |__  _ __  (_)
"  | '_ \| '_ \| '_ \ | |
"  | |_) | |_) | | | || |
"  | .__/|_.__/|_| |_|/ |
"  |_|              |__/
"
" Author:      Peter Benjamin
" Description: Minimal, 16-color colorscheme that works on light & dark terminal & GUI Vim.

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
let g:colors_name='pbnj'

hi!  Normal      NONE
hi!  SignColumn  NONE
hi!  SpecialKey  NONE
hi!  VertSplit   NONE
hi!  Visual      NONE

hi!  ColorColumn   cterm=reverse         ctermfg=DarkRed      ctermbg=NONE
hi!  Comment       cterm=NONE            ctermfg=DarkGray     ctermbg=NONE
hi!  Constant      cterm=NONE            ctermfg=DarkRed      ctermbg=NONE
hi!  CurSearch     cterm=reverse         ctermfg=DarkRed      ctermbg=NONE
hi!  CursorColumn  cterm=reverse         ctermfg=DarkGray     ctermbg=NONE
hi!  DiffAdd       cterm=bold            ctermfg=DarkGreen    ctermbg=NONE
hi!  DiffChange    cterm=bold            ctermfg=DarkYellow   ctermbg=NONE
hi!  DiffDelete    cterm=bold            ctermfg=DarkRed      ctermbg=NONE
hi!  DiffText      cterm=bold,underline  ctermfg=DarkYellow   ctermbg=NONE
hi!  Directory     cterm=bold            ctermfg=NONE         ctermbg=NONE
hi!  Error         cterm=reverse         ctermfg=Red          ctermbg=NONE
hi!  ErrorMsg      cterm=bold            ctermfg=DarkRed      ctermbg=NONE
hi!  Folded        cterm=NONE            ctermfg=DarkGray     ctermbg=NONE
hi!  Identifier    cterm=NONE            ctermfg=DarkCyan     ctermbg=NONE
hi!  Ignore        cterm=NONE            ctermfg=DarkGray     ctermbg=NONE
hi!  LineNr        cterm=NONE            ctermfg=DarkGray     ctermbg=NONE
hi!  MatchParen    cterm=bold            ctermfg=NONE         ctermbg=NONE
hi!  ModeMsg       cterm=bold            ctermfg=NONE         ctermbg=NONE
hi!  MoreMsg       cterm=bold            ctermfg=DarkGreen    ctermbg=NONE
hi!  NonText       cterm=NONE            ctermfg=DarkGray     ctermbg=NONE
hi!  Pmenu         cterm=reverse         ctermfg=DarkMagenta  ctermbg=NONE
hi!  PmenuSel      cterm=reverse         ctermfg=NONE         ctermbg=NONE
hi!  PreProc       cterm=NONE            ctermfg=DarkMagenta  ctermbg=NONE
hi!  Question      cterm=bold            ctermfg=DarkGreen    ctermbg=NONE
hi!  Search        cterm=reverse         ctermfg=DarkYellow   ctermbg=Black
hi!  Special       cterm=NONE            ctermfg=DarkMagenta  ctermbg=NONE
hi!  SpellBad      cterm=reverse         ctermfg=Red          ctermbg=NONE
hi!  SpellCap      cterm=reverse         ctermfg=Yellow       ctermbg=NONE
hi!  SpellLocal    cterm=reverse         ctermfg=Magenta      ctermbg=NONE
hi!  SpellRare     cterm=reverse         ctermfg=Cyan         ctermbg=NONE
hi!  Statement     cterm=NONE            ctermfg=DarkYellow   ctermbg=NONE
hi!  TabLine       cterm=reverse         ctermfg=NONE         ctermbg=NONE
hi!  TabLineSel    cterm=bold            ctermfg=NONE         ctermbg=NONE
hi!  Title         cterm=bold            ctermfg=DarkMagenta  ctermbg=NONE
hi!  Todo          cterm=NONE            ctermfg=Black        ctermbg=DarkYellow
hi!  Type          cterm=NONE            ctermfg=DarkGreen    ctermbg=NONE
hi!  Visual        cterm=reverse         ctermfg=NONE         ctermbg=NONE
hi!  WarningMsg    cterm=bold            ctermfg=DarkYellow   ctermbg=NONE

if has('gui_running')
hi!  ColorColumn   gui=reverse         guifg=DarkRed      guibg=NONE
hi!  Comment       gui=NONE            guifg=DarkGray     guibg=NONE
hi!  Constant      gui=NONE            guifg=DarkRed      guibg=NONE
hi!  CurSearch     gui=reverse         guifg=DarkRed      guibg=NONE
hi!  CursorColumn  gui=reverse         guifg=DarkGray     guibg=NONE
hi!  DiffAdd       gui=bold            guifg=DarkGreen    guibg=NONE
hi!  DiffChange    gui=bold            guifg=DarkYellow   guibg=NONE
hi!  DiffDelete    gui=bold            guifg=DarkRed      guibg=NONE
hi!  DiffText      gui=bold,underline  guifg=DarkYellow   guibg=NONE
hi!  Directory     gui=bold            guifg=NONE         guibg=NONE
hi!  Error         gui=reverse         guifg=Red          guibg=NONE
hi!  ErrorMsg      gui=bold            guifg=DarkRed      guibg=NONE
hi!  Folded        gui=NONE            guifg=DarkGray     guibg=NONE
hi!  Identifier    gui=NONE            guifg=DarkCyan     guibg=NONE
hi!  Ignore        gui=NONE            guifg=DarkGray     guibg=NONE
hi!  LineNr        gui=NONE            guifg=DarkGray     guibg=NONE
hi!  MatchParen    gui=bold            guifg=NONE         guibg=NONE
hi!  ModeMsg       gui=bold            guifg=NONE         guibg=NONE
hi!  MoreMsg       gui=bold            guifg=DarkGreen    guibg=NONE
hi!  NonText       gui=NONE            guifg=DarkGray     guibg=NONE
hi!  Pmenu         gui=reverse         guifg=DarkMagenta  guibg=NONE
hi!  PmenuSel      gui=reverse         guifg=NONE         guibg=NONE
hi!  PreProc       gui=NONE            guifg=DarkMagenta  guibg=NONE
hi!  Question      gui=bold            guifg=DarkGreen    guibg=NONE
hi!  Search        gui=reverse         guifg=DarkYellow   guibg=Black
hi!  Special       gui=NONE            guifg=DarkMagenta  guibg=NONE
hi!  SpellBad      gui=reverse         guifg=Red          guibg=NONE
hi!  SpellCap      gui=reverse         guifg=Yellow       guibg=NONE
hi!  SpellLocal    gui=reverse         guifg=Magenta      guibg=NONE
hi!  SpellRare     gui=reverse         guifg=Cyan         guibg=NONE
hi!  Statement     gui=NONE            guifg=DarkYellow   guibg=NONE
hi!  TabLine       gui=reverse         guifg=NONE         guibg=NONE
hi!  TabLineSel    gui=bold            guifg=NONE         guibg=NONE
hi!  Title         gui=bold            guifg=DarkMagenta  guibg=NONE
hi!  Todo          gui=NONE            guifg=Black        guibg=DarkYellow
hi!  Type          gui=NONE            guifg=DarkGreen    guibg=NONE
hi!  Visual        gui=reverse         guifg=NONE         guibg=NONE
hi!  WarningMsg    gui=bold            guifg=DarkYellow   guibg=NONE
endif

hi!  link  EndOfBuffer                 NonText
hi!  link  IncSearch                   Search
hi!  link  PmenuSBar                   Pmenu
hi!  link  PmenuThumb                  PmenuSel
hi!  link  QuickFixLine                Error
hi!  link  SpecialKey                  NonText
hi!  link  TabLineFill                 TabLine
hi!  link  diffAdded                   DiffAdd
hi!  link  diffChanged                 DiffChange
hi!  link  diffRemoved                 DiffDelete
hi!  link  ALEVirtualTextError         DiffDelete
hi!  link  ALEVirtualTextWarning       DiffChange
hi!  link  ALEVirtualTextInfo          DiffChange
hi!  link  ALEVirtualTextStyleError    DiffDelete
hi!  link  ALEVirtualTextStyleWarning  DiffChange
