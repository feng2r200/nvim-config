"======================================================================
" init-tabsize.vim - tab size 设置
"======================================================================

"----------------------------------------------------------------------
" 默认缩进模式
"----------------------------------------------------------------------

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 禁止展开 tab (noexpandtab)
set noet

" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

augroup PythonTab
	au!
augroup END

