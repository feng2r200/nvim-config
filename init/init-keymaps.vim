""" Plugins mapping config ---------------------------------------------------

" coc {{
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <M-e> :CocCommand explorer<CR>

" Symbol renaming.
nmap <leader>rr <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}

" any-jump {{
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>
" }}

" UndoTree {{
noremap <leader>ud :UndotreeToggle<CR>
function g:Undotree_CustomMap()
	nmap <buffer> n <plug>UndotreeNextState
	nmap <buffer> p <plug>UndotreePreviousState
endfunc
" }}

" vim-easymotion {{
" Integration with incsearch.vim
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<C-l>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> z?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> zg/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

nmap ff  <Plug>(easymotion-overwin-w)
nmap fl  <Plug>(easymotion-overwin-line)
nmap ft  <Plug>(easymotion-sn)
" }}

" vim-visual-multi {{
let g:VM_maps = {}

let g:VM_maps['Find Under']                  = '<leader><leader>n'
let g:VM_maps['Find Subword Under']          = '<leader><leader>n'
let g:VM_maps["Add Cursor At Pos"]           = ''
" }}

" vim-floaterm {{
tnoremap   <silent>   <ESC>gt    <C-\><C-n>:FloatermPrev<CR>
tnoremap   <silent>   <ESC>gT    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>      :FloatermToggle<CR>
tnoremap   <silent>   <F12>      <C-\><C-n>:FloatermToggle<CR>
" }}

" vimspector {{

" }}

""" Common mapping config ---------------------------------------------------
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

" clear the search buffer when hitting return
nnoremap <silent> <BS>           :nohlsearch<CR>

