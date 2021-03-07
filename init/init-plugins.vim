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

" Auto Complete{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
" }

" Treesitter{
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" }

" Status line{
Plug 'itchyny/lightline.vim'
" }

" Taglist{
Plug 'liuchengxu/vista.vim'
" }

call plug#end() "}}

" coc.vim
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
            \ 'coc-highlight',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-lists',
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

