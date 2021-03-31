"=========================================================
"
" init-plugin.vim -
"
"=========================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"---------------------------------------------------------
" 安装插件
"---------------------------------------------------------

call plug#begin('~/.config/nvim/plugged') "{{

" colorschemas {
Plug 'nanotech/jellybeans.vim'
" }

" Treesitter {
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" }

" Auto Complete {
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
Plug 'asins/vim-dict'
" }

" Status line {
Plug 'itchyny/lightline.vim'
" }

" Taglist {
" 提供 ctags/gtags 后台数据库自动更新功能
Plug 'ludovicchabant/vim-gutentags'
" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
Plug 'skywind3000/gutentags_plus'
" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'skywind3000/vim-preview'
" }

" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）{
Plug 'kshenoy/vim-signature'
" }

" File navigation {
" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
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

" Go {
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
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
Plug 'voldikss/LeaderF-floaterm'
" }

call plug#end()
"}}

" nvim-treesitter {{
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"bash", "css", "go", "html", "java", "javascript", "json", "lua", "python", "regex", "toml"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = {},               -- list of language that will be disabled
	},
	indent = {
		enable = true,
	},
	playground = {                -- TSPlaygroundToggle
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		}
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = {"BufWrite", "CursorHold"},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = false,
		},
		move = {
			enable = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["df"] = "@function.outer",
				["dF"] = "@class.outer",
			},
		},
	},
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}

"---------------------------------------------------------
" 配置插件
"---------------------------------------------------------

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

" lightline {{
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [['mode', 'paste'], ['filename', 'modified', 'readonly']],
            \   'right': [['lineinfo'], ['percent'], ['cocstatus', 'gitbranch', 'fileformat', 'fileencoding', 'filetype']]
            \ },
            \ 'component_function': { 
            \   'gitbranch': 'FugitiveHead',
            \   'cocstatus': 'coc#status'
            \ },
            \ }
" }}

" ctags {{
" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
let g:gutentags_project_root = ['.root', '.git', '.project', '.idea']

" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 默认禁用自动生成
let g:gutentags_modules = [] 

" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif

" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 设置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--langdef=Go', '--langmap=Go:.go',
			\ '--regex-Go=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/',
			\ '--regex-Go=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/',
			\ '--regex-Go=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/']

" 使用 universal-ctags 的话需要下面这行，请反注释
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_plus_nomap = 1
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

" LeaderF {{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_MruMaxFiles = 2048
let g:Lf_RootMarkers = ['.root', '.git', '.project', '.idea', '.vscode']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/leaderf')
let g:Lf_WildIgnore = {
			\ 'dir': ['.git', '.svn', '.hg', '.idea'],
			\ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]']
			\ }
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_StlColorscheme = 'powerline'
" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult =  {'Function': 0, 'BufTag': 0}
" 使用 ESC 退出 normal 模式
let g:Lf_NormalMap = {
			\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
			\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
			\ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
			\ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
			\ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
			\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
			\ }
" }}

" any-jump {{
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_search_prefered_engine = 'ag'
let g:any_jump_colors = { "help": "Function" }

nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>
" }}

" UndoTree {{
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

noremap <leader>ud :UndotreeToggle<CR>
function g:Undotree_CustomMap()
	nmap <buffer> p <plug>UndotreeNextState
	nmap <buffer> n <plug>UndotreePreviousState
endfunc
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
  autocmd FileType json syntax match Comment +\/\/.\+$+
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

" AsyncTasks {{
let g:asyncrun_open = 6

let g:asyncrun_rootmarks = ['.root', '.git', '.project', '.idea', '.vscode']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10
let g:asynctasks_term_focus = 0
" }}

" vim-go {{
let g:go_list_type = "quickfix"
" }}

" vim-xtabline {{
let g:xtabline_settings = get(g:, 'xtabline_settings', {})

let g:xtabline_settings.indicators = {
        \ 'modified': '[+]',
        \ 'pinned': '[📌]',
        \}
let g:xtabline_settings.icons = {
        \'pin': '📌',
        \'star': '★',
        \'book': '📖',
        \'lock': '🔒',
        \'hammer': '🔨',
        \'tick': '✔',
        \'cross': '✖',
        \'warning': '⚠',
        \'menu': '☰',
        \'apple': '🍎',
        \'linux': '🐧',
        \'windows': '⌘',
        \'git': '',
        \'palette': '🎨',
        \'lens': '🔍',
        \'flag': '🏁',
        \}

let g:xtabline_settings.enable_mappings = 0
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

