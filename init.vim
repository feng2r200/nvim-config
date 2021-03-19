"=========================================================
"
" init.vim - initialize config
"
"=========================================================

" 定义Vim配置文件的目录变量
let s:home = "$HOME/.config/nvim"

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

"=========================================================
" 模块加载
"=========================================================

" 加载基础配置
LoadScript init/init-basic.vim

" 加载扩展配置
LoadScript init/init-config.vim

" 设定 tabsize
LoadScript init/init-tabsize.vim

" 插件加载
LoadScript init/init-plugins.vim

" 界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim

