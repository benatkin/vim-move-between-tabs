# vim-combine-tabs

This plugin is for combining tabs.

* To move the buffer from the current window to a window in the previous tab, call `MoveToPrevTab` or use the mapping `tP`.
* To move to the next tab, use MoveToNextTab or tN.
* To prevent the mappings from being set, set `g:surround_no_mappings` before the plugin is loaded.

If there is a tab in the direction the buffer is being moved to, the current
buffer will be added above the bottom right window on the adjacent tab.
If there isn't a tab in the direction the buffer is being moved to, a
new tab will be created.

# Credits

Original implementations from:

* [vim wiki](http://vim.wikia.com/wiki/Move_current_window_between_tabs) - function source (slightly modified)
* [chillu's dotfiles](http://dotfiles.org/~chillu/.vimrc) - the bindings

# LICENSE

Licensed under the same terms as Vim itself.
