" combine-tabs.vim - Combine Tabs
" Author:       Ben Atkin <ben@benatkin.com>
" Version:      0.1
"
" See combine-tabs.txt for help.
"
" Licensed under the same terms as Vim itself.

" Original implementations from:
"   http://vim.wikia.com/wiki/Move_current_window_between_tabs
"   http://dotfiles.org/~chillu/.vimrc

" Move windows to Adjacent Tabs or Create new Tabs to accomodate them.
function! s:MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    " go to lower right window, to avoid splitting left pane
    winc b
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! s:MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    " go to lower right window, to avoid splitting left pane
    winc b
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

noremap <silent> <Plug>WindowToPrevTab :<C-U>call <SID>MoveToPrevTab()<CR>
noremap <silent> <Plug>WindowToNextTab :<C-U>call <SID>MoveToNextTab()<CR>

if !exists("g:combine_tabs_no_mappings") || ! g:combine_tabs_no_mappings
  " Bind keys for Moving Tabs
  map tP <Plug>WindowToPrevTab
  map tN <Plug>WindowToNextTab
end

