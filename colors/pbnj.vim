" vim:et:sw=2:sts=2:ts=2:
"         _            _
"   _ __ | |__  _ __  (_)
"  | '_ \| '_ \| '_ \ | |
"  | |_) | |_) | | | || |
"  | .__/|_.__/|_| |_|/ |
"  |_|              |__/
"
" Author:      Peter Benjamin
" Description: Minimal, 16-color colorscheme that works on light & dark terminal
"              & GUI Vim.

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

highlight! clear
if exists("g:syntax_on") | syntax reset | endif
let g:colors_name='pbnj'

highlight!  DiffAdd     cterm=bold    ctermfg=darkgreen  ctermbg=none
highlight!  DiffChange  cterm=bold    ctermfg=brown      ctermbg=none
highlight!  DiffDelete  cterm=bold    ctermfg=darkred    ctermbg=none
highlight!  DiffText    cterm=bold    ctermfg=brown      ctermbg=none
highlight!  Comment     cterm=italic  ctermfg=darkgray   ctermbg=none
highlight!  MatchParen  cterm=bold    ctermfg=none       ctermbg=none
highlight!  NonText     cterm=none    ctermfg=darkgray   ctermbg=none
highlight!  SpecialKey  cterm=none    ctermfg=darkgray   ctermbg=none
