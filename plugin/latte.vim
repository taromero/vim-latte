" License:	This file is placed in the public domain.

if exists("g:loaded_vimlatte")
  finish
endif
let g:loaded_vimlatte = 1

let s:save_cpo = &cpo
set cpo&vim

if !hasmapto('<Plug>VimlatteRunCurrentSpecFile')
  map <unique> <Leader>l  <Plug>VimlatteRunCurrentSpecFile
endif

noremap <unique> <script> <Plug>VimlatteRunCurrentSpecFile :LatteRunCurrentSpecFile <cr>

function s:RunCurrentSpecFile()
  silent echo system('curl ' . escape('localhost:3000/test?suite=' . expand('%:p'), '\\/.*?$^~[]'))
endfunction

if !exists(":LatteRunCurrentSpecFile")
  command LatteRunCurrentSpecFile :call s:RunCurrentSpecFile()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
