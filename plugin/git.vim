command! GRoot execute 'lcd '..finddir('.git/..', expand('%:p:h')..';')
