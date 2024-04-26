vim9script
if !exists('g:loaded_vimcomplete')
  finish
endif
var options = {
  completor: { shuffleEqualPriority: true, postfixHighlight: true },
  buffer: { enable: true, priority: 10, envComplete: true },
  abbrev: { enable: true, priority: 10 },
  lsp: { enable: true, priority: 10, maxCount: 5 },
  vsnip: { enable: true, priority: 11 },
  vimscript: { enable: true, priority: 11 },
}
autocmd VimEnter * g:VimCompleteOptionsSet(options)
