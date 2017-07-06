" ****************************************************************************
" File:             checkbox.vim
" Author:           Jonas Kramer
" Version:          0.1
" Last Modified:    2010-06-01
" Copyright:        Copyright (C) 2010 by Jonas Kramer. Published under the
"                   terms of the Artistic License 2.0.
" ****************************************************************************
" Installation: Copy this script into your plugin folder.
" Usage: Press "<leader>tt" to toggle the (first) checkbox on the current
" line, if any. That means, "[ ]" will be replaced with "[x]" and "[x]" with
" "[ ]".
" ****************************************************************************

if exists('g:loaded_checkbox')
	" finish
endif

fu! checkbox#ToggleCB()
	let line = getline('.')

	if(match(line, "\\[ \\]") != -1)
		let line = substitute(line, "\\[ \\]", "[-]", "")
	elseif(match(line, "\\[-\\]") != -1)
		let line = substitute(line, "\\[-\\]", "[x]", "")
	elseif(match(line, "\\[x\\]") != -1)
		let line = substitute(line, "\\[x\\]", "[ ]", "")
	endif

	call setline('.', line)
endf

command! ToggleCB call checkbox#ToggleCB()

nmap <silent> <leader>tt :ToggleCB<cr>

let g:loaded_checkbox = 1
