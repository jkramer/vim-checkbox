" ****************************************************************************
" File:             checkbox.vim
" Author:           Jonas Kramer
" Version:          0.1
" Last Modified:    2018-05-07
" Copyright:        Copyright (C) 2010-2018 by Jonas Kramer. Published under the
"                   terms of the Artistic License 2.0.
" ****************************************************************************
" Installation: Copy this script into your plugin folder.
" Usage: Press "<leader>tt" to toggle the (first) checkbox on the current
" line, if any. That means, "[ ]" will be replaced with "[x]" and "[x]" with
" "[ ]". If you want more or different checkbox states, you can override the
" contents of g:checkbox_states with an array of characters, which the plugin
" will cycle through. The default is:
"
"     let g:checkbox_states = [' ', 'x']
"
" When there's no checkbox on the current line, "<leader>tt" will insert one
" at the pattern defined in g:insert_checkbox. The new checkbox's state will
" be the first element of g:checkbox_states. The default for g:insert_checkbox
" is '\<', which will insert the checkbox in front of the first word of the
" line (not necessarily at the beginning of the line, '^'), which is
" particularly useful when working in markdown-formatted lists. The pattern
" can be overridden. Other useful patterns would be '^' (insert at the very
" beginning of the line) and '$' (end of line). When inserting a new checkbox,
" g:insert_checkbox_prefix and g:insert_checkbox_suffix are
" prepended/appended, respectively. This is mostly useful for adding a space
" behind the checkbox, which is the default:
"
"     let g:insert_checkbox_prefix = ''
"     let g:insert_checkbox_suffix = ' '
"
" Inserting a checkbox can be disabled by setting g:insert_checkbox to an
" empty string ('').
" ****************************************************************************

if exists('g:loaded_checkbox')
	finish
endif

if !exists('g:checkbox_states')
  let g:checkbox_states = [' ', 'x']
endif


if !exists('g:insert_checkbox')
  "let g:insert_checkbox = '^'
  "let g:insert_checkbox = '$'
  let g:insert_checkbox = '\<'
endif

if !exists('g:insert_checkbox_prefix')
  let g:insert_checkbox_prefix = ''
endif

if !exists('g:insert_checkbox_suffix')
  let g:insert_checkbox_suffix = ' '
endif

fu! checkbox#ToggleCB()
	let line = getline('.')

  if(match(line, '\[.\]') != -1)
    let states = copy(g:checkbox_states)
    call add(states, g:checkbox_states[0])

    for state in states
      if(match(line, '\[' . state . '\]') != -1)
        let next_state = states[index(states, state) + 1]
        let line = substitute(line, '\[' . state . '\]', '[' . next_state . ']', '')
        break
      endif
    endfor
  else
    if g:insert_checkbox != ''
      let line = substitute(line, g:insert_checkbox, g:insert_checkbox_prefix . '[' . g:checkbox_states[0] . ']' . g:insert_checkbox_suffix, '')
    endif
  endif

	call setline('.', line)
endf

command! ToggleCB call checkbox#ToggleCB()

map <silent> <leader>tt :call checkbox#ToggleCB()<cr>

let g:loaded_checkbox = 1
