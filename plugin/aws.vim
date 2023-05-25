" Custom cmmand for `aws` with completion for profile names
function! AWSProfileCompletion(A,L,P) abort
  return filter(systemlist("awk -F '[][]' '{print $2}' ~/.aws/config | awk 'NF > 0 {print $2}'"),'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,AWSProfileCompletion AWS Dispatch aws --output text --profile <args>
