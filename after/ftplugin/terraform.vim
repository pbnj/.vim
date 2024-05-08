vim9script

&l:formatprg = 'terraform fmt -'

def TFenvCompletion(A: string, L: string, P: number): list<string>
  return [
    'install',
    'use',
    'uninstall',
    'list',
    'list-remote',
    'version-name',
    'init',
    'pin',
  ]->filter((i, v) => v =~ A)
enddef
command! -buffer -nargs=? -complete=customlist,TFenvCompletion TFenv ! tfenv <args>

# TerraformStateCompletion provides terraform resource address suggestions to
# :TerraformStateShow command
def TerraformStateCompletion(A: string, L: string, P: number): list<string>
  var cmd = $'terraform -chdir={fnamemodify(expand('%'), ':h')} state list 2>/dev/null'
  return systemlist(cmd)->filter((i, v) => v =~ A)
enddef
command! -buffer -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow <mods> terminal terraform -chdir=%:h state show <args>
