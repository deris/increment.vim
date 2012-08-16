"=============================================================================
" File: increment.vim
" Author: yohe <ysekiguchi.zzz@gmail.com>
" WebPage: 
" License: MIT
" Version: 0.1
"=============================================================================

if exists("g:loaded_increment")
  finish
endif
let g:loaded_increment = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 -range NextPattern :call increment#next_pattern()
command! -nargs=0 -range PrevPattern :call increment#prev_pattern()

let &cpo = s:save_cpo
unlet s:save_cpo

