" ****************************************************************************
" File:             checkbox.vim
" Author:           Jonas Kramer, Patrick Messina
" Version:          0.2
" Last Modified:    2017-12-03
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
		let line = substitute(line, "\\[ \\]", "[x]", "")
	elseif(match(line, "\\[x\\]") != -1)
		let line = substitute(line, "\\[x\\]", "[ ]", "")
	endif

	call setline('.', line)
endf

fu! checkbox#CreateCB()
    
        let l:line = getline('.')

        if matchstr(l:line, '-\ \[x\]') == '- [x]' 
            " If - [x] exists delete checkbox
            let l:line = substitute(line, "-\\ \\[x\\]\\ ", "", "")
        elseif matchstr(l:line, '-\ \[\ \]') != '- [ ]' 
            " If - [ ]  does not exist, create it.
            let l:line = substitute(line, "^", "-\\ \\[\\ \\]\\ ", "")
        elseif matchstr(l:line, '-\ \[\ \]') == '- [ ]' 
            " If - [ ] exists delete it x
            let l:line = substitute(line, "-\\ \\[\\ \\]\\ ", "", "")
        endif

	call setline('.', line)
endf


command! ToggleCB call checkbox#ToggleCB()
command! CreateCB call checkbox#CreateCB()

nmap <silent> <leader>tt :ToggleCB<cr>
nmap <silent> <leader>nt :CreateCB<cr>

let g:loaded_checkbox = 1
