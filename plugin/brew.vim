if exists('g:loaded_brew') | finish | endif
let g:loaded_brew = 1

command! BrewUp
      \ Sh brew update && brew outdated && brew upgrade && brew cleanup
