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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
Plug 'tpope/vim-fugitive'
" }

" Autoformat {
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" }

" Python {
" }

" Editor Enhancement{
Plug 'jiangmiao/auto-pairs'
" :help visual-multi
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
" Comment code h: tcomment
Plug 'tomtom/tcomment_vim'
" vim motion on speed
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" show indent line
Plug 'Yggdroot/indentLine'
" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'
" }

" 文本对象 {
Plug 'wellle/targets.vim'
" }

" Find & Replace {
Plug 'brooth/far.vim'
" }

" Use a tasks for vim {
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
" }

" Other visual enhancement {
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
" }

" 浮动终端 {
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/clap-floaterm'
" }

call plug#end()
"}}

" nvim-treesitter {{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",     -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},               -- list of language that will be disabled
  },
  indent = {
    enable = true,
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}

" coc.vim {{
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
			\ 'coc-floaterm',
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
            \ 'coc-toml',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-yaml']

" }}

" lightline {{
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [['mode', 'paste'], ['filename', 'modified', 'method', 'readonly']],
            \   'right': [['lineinfo'], ['percent'], ['cocstatus', 'gitbranch', 'fileformat', 'fileencoding', 'filetype']]
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
" Project root markers
let g:clap_project_root_markers = ['.root', '.git', '.project', '.idea', '.vscode']
let g:clap_theme = 'material_design_dark'
" }}

" any-jump {{
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_search_prefered_engine = 'ag'
let g:any_jump_colors = { "help": "Function" }
" }}

" vimspector {{
let g:vimspector_enable_mappings = 'HUMAN'
" }}

" UndoTree {{
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
" }}

" gitgutter {{
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
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

" vim-easymotion {{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" }}

" AsyncTasks {{
let g:asyncrun_open = 6

let g:asyncrun_rootmarks = ['.root', '.git', '.project', '.idea', '.vscode']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10
let g:asynctasks_term_focus = 0
" }}

