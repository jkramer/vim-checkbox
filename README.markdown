# Vim Checkbox


## Description

Simple plugin that toggles text checkboxes in Vim. Works great if you're using
a markdown file for notes and todo lists.


## Installation

Just copy the script into your plugin folder, e.g. `~/.vim/plugin/`.


## Usage

Type `<leader>tt` to toggle the (first) checkbox on the current line. A checkbox
is either `[ ]` (unchecked) or `[x]` (checked). If no checkbox is present, a checkbox
will be added at the end of the line. For example,

    * [ ] Do some work.

becomes

	* [x] Do some work.

and vice versa.

Also

    Do some work.

becomes

    Do some work. [ ]

## Disclaimer

This is a slightly modified version of vim-checkbox (https://github.com/jkramer/vim-checkbox/).
Released under the Artistic Licence 2.0.

### Changes

Added feature where if no checkbox is present, by typing `<leader> tt`, an empty checkbox will be
added to the end of the line. 

