"======================================================================
"
" init-config.vim - 正常模式下的配置
" 在 init-basic.vim 后调用
"
"======================================================================

"----------------------------------------------------------------------
" 有 tmux 时 设置功能键超时(毫秒)
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif

"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	set t_ut=
endif

"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

set nobackup
set nowritebackup

" 禁用交换文件
set noswapfile

" undo 文件
" set noundofile
if has('persistent_undo')
	set undofile
	set undodir=~/.cache/undo
endif

"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------
" 打开文件时恢复上次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 文件被vim之外的程序修改后,重新读取
set autoread

" Text might fail if hidden is not set
set hidden

" 支持系统剪切板
set clipboard+=unnamed,unnamedplus

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set rtp+=/usr/local/opt/fzf

"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup
	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown 允许自动换行
	au FileType markdown setlocal wrap

	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	au FileType haskell setlocal et

	" quickfix 隐藏行号
	au FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END

"----------------------------------------------------------------------
" neovim 配置
"----------------------------------------------------------------------
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'

