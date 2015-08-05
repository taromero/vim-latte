if exists("g:loaded_vimlatte")
  finish
endif
let g:loaded_vimlatte = 1

if !hasmapto('<Plug>VimlatteRunCurrentSpecFile')
  map <unique> <Leader>l  <Plug>VimlatteRunCurrentSpecFile
endif

noremap <unique> <script> <Plug>VimlatteRunCurrentSpecFile :LatteRunCurrentSpecFile <cr>

if !exists(":LatteRunCurrentSpecFile")
  command LatteRunCurrentSpecFile :silent echo system('curl ' . escape('localhost:3000/test?suite=' . expand('%:p'), '\\/.*?$^~[]'))
endif

