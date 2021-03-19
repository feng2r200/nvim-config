"=========================================================
"
" init-plugin.vim -
"
"=========================================================

"---------------------------------------------------------
" 安装插件
"---------------------------------------------------------

call plug#begin('~/.config/nvim/plugged') "{{

" colorschemas {
Plug 'flazz/vim-colorschemes'
" }

" Treesitter {
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" }

" Auto Complete {
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
" }

" Status line {
Plug 'itchyny/lightline.vim'
" }

" Taglist {
Plug 'liuchengxu/vista.vim'
" }

" General Highlighter {
" automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'
" }

" File navigation {
" h: vim-clap
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" h: any-jump
Plug 'pechorin/any-jump.vim'
" }

" Debugger {
Plug 'puremourning/vimspector'
" }

" UndoTree {
Plug 'mbbill/undotree'
" }

" Git {
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'
" }

" Autoformat {
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" }

" Python {
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" :h braceless
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
" }

" Editor Enhancement{
Plug 'jiangmiao/auto-pairs'
" :help [visual-multi]|[vm-some-topic]
Plug 'mg979/vim-visual-multi'
" Comment code
Plug 'tomtom/tcomment_vim'
" surround
Plug 'tpope/vim-surround'
" range selection
Plug 'gcmt/wildfire.vim'
" }

call plug#end() "}}

" coc.vim {{
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
			\ 'coc-go',
            \ 'coc-highlight',
            \ 'coc-java',
			\ 'coc-java-debug',
            \ 'coc-json',
            \ 'coc-lists',
			\ 'coc-lua',
			\ 'coc-markdownlint',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-python',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-sql',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-tasks',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-yaml']
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}

" lightline {{
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [['mode', 'paste'], ['cocstatus', 'gitbranch', 'readonly', 'filename', 'method', 'modified']],
            \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
            \ },
            \ 'component_function': { 
            \   'gitbranch': 'FugitiveHead',
            \   'cocstatus': 'coc#status',
            \   'method': 'NearestMethodOrFunction'
            \ },
            \ }
" }}

" vista {{
let g:vista_default_executive='coc'
" To enable fzf's preview window set g:vista_fzf_preview
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview=['right:50%']
" }}

" vim-illuminate {{
let g:Illuminate_delay = 100
hi link illuminatedWord Visual
" }}

" python with virtualenv support {
python3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" }

" vim-clap {{
" Use <C-n>/<C-p> instead of <C-j>/<C-k> to navigate the result.
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
" Project root markers
let g:clap_project_root_markers = ['.root', '.git', '.git/', '.idea', '.vscode']
" }}

" any-jump {{
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>

let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_search_prefered_engine = 'ag'
let g:any_jump_colors = { "help": "Function" }
" }}

" vimspector {{
let g:vimspector_enable_mappings = 'HUMAN'
" }}

" UndoTree {{
noremap <leader>ud :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
endfunc
" }}

" gitgutter {{
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
" }}

" lazygit.vim {{
nnoremap <silent> <leader>lg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
" }}

" Autoformat {{
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
" }}

" vim-python-pep8-indent {{
let python_pep8_indent_hang_closing = 1
" }}

" braceless {{
autocmd FileType python,haml,yaml,coffee BracelessEnable +indent +fold +highlight
" }}

" auto-pairs {{
"
" }}

