""" Plugins mapping config ---------------------------------------------------

" coc {{
" Use `[g` and `]g` to navigate diagnostics
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

nnoremap <leader>1 :CocCommand explorer<CR>

" Symbol renaming.
nmap <leader>rr <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}

" vim-clap {{
" Use <C-n>/<C-p> instead of <C-j>/<C-k> to navigate the result.
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
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
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
endfunc
" }}

" lazygit {{
nnoremap <silent> <leader>lg :LazyGit<CR>
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

""" Common mapping config ---------------------------------------------------

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Yank and paste from clipboard
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,yy "+yy
nnoremap ,p "+p

" have x (removes single character) not go into the default registry
nnoremap x "_x
" Make X an operator that removes without placing text in the default registry
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap x "_d

" don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Change line, better use S for this.
nmap cc 1S

" Copy Word
nmap ,c yiw

" Reselect last-pasted text
nnoremap gp `[v`]

" clear the search buffer when hitting return
nnoremap <leader><CR> :nohlsearch<CR>

