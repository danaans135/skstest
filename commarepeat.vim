" vim:foldmethod=marker:fen:
scriptencoding utf-8

if exists('g:loaded_commarepeat') && g:loaded_commarepeat
    finish
endif
let g:loaded_commarepeat = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:CommaRepeat() range
  "let str = ""
  let alist = []
  let lnum = a:firstline
  while lnum <= a:lastline
    "let str = str . "print " . getline(lnum)
    "let str = str . "Private " . getline(lnum) . " As String\r\n"
    call add(alist, "Private " . getline(lnum) . " As String")
    let lnum = lnum + 1
  endwhile
"  normal a:lastline."G"
  let failed = append(line('$'), alist)
  "let failed = append(line('$'), str)
endfunction
"
command! -range CommaRepeat :<line1>,<line2>call s:CommaRepeat()

let &cpo = s:save_cpo
