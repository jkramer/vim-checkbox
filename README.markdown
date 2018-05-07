

Vim Checkbox
============


Description
-----------

Simple plugin that toggles text checkboxes in Vim. Works great if you're using
a markdown file for notes and todo lists.


Installation
------------

Just copy the script into your plugin folder, e.g. `~/.vim/plugin/`. If you're
using pathogen, just clone this repository in `~/.vim/bundle`.


Usage
-----

Press `<leader>tt` to toggle the (first) checkbox on the current
line, if any. That means, `[ ]` will be replaced with `[x]` and `[x]` with
`[ ]`. If you want more or different checkbox states, you can override the
contents of `g:checkbox_states` with an array of characters, which the plugin
will cycle through. The default is:

    let g:checkbox_states = [' ', 'x']

When there's no checkbox on the current line, `<leader>tt` will insert one
at the pattern defined in `g:insert_checkbox`. The new checkbox's state will
be the first element of `g:checkbox_states`. The default for `g:insert_checkbox`
is `'\<'`, which will insert the checkbox in front of the first word of the
line (not necessarily at the beginning of the line, `'^'`), which is
particularly useful when working in markdown-formatted lists. Other useful
patterns would be `'^'` (insert at the very beginning of the line) and `'$'` (end
of line). When inserting a new checkbox, `g:insert_checkbox_prefix` and
`g:insert_checkbox_suffix` are prepended/appended, respectively. This is mostly
useful for adding a space behind or in front of the checkbox:

    let g:insert_checkbox_prefix = ''
    let g:insert_checkbox_suffix = ' '

Inserting a checkbox can be disabled by setting `g:insert_checkbox` to an
empty string (`''`).
