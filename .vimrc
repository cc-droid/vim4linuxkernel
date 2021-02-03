"设置前缀
let mapleader=","

"显示行号
set nu
noremap <leader>n : set nu<CR>
noremap <leader>m : set nonu<CR>
noremap <leader>r : set relativenumber<CR>
noremap <leader>t : set norelativenumber<CR>

"显示特殊字符
noremap <leader>v :set invlist<CR>
noremap <leader>shift+v :set nolist<CR>
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"不需要备份
set nobackup      "不需要备份文件
set noswapfile    "不创建临时交换文件
set nowritebackup "编辑的时候不需要备份文件
set noundofile    "不创建撤销文件

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch
nmap nh : noh <CR>


"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
"set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"vundle管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
" 插件列表结束
call vundle#end()
filetype plugin indent on

" 配色方案
set background=dark
colorscheme torte
"colorscheme molokai
"colorscheme phd

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

syntax keyword cppSTLtype initializer_list

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

"允许用退格键删除字符
set backspace=indent,eol,start

"编码设置
set encoding=utf-8

"共享剪切板
set clipboard=unnamedplus,unnamed " 为了在多窗口见方面的复制粘贴, 这里选择默认使用’+'剪切板
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
" 添加文件模板
autocmd BufNewFile *.c 0r ~/.vim/template/c-config.c
autocmd BufNewFile Makefile 0r ~/.vim/template/Makefile

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

"noremap <c-z> <NOP>
" 换行的时候可以自动跳到下一行
imap {<CR> {<CR>}<ESC>O

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
			
"----------------------------------------------------------------------------------"
" ctags  database config
"----------------------------------------------------------------------------------"
set tags=/home/develop/v-kernel-qemu/src/linux-5.6.11/tags " ctags database 

"----------------------------------------------------------------------------------"
" cscope database config
"----------------------------------------------------------------------------------"
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

cs add /home/develop/v-kernel-qemu/src/linux-5.6.11/cscope.out /home/develop/v-kernel-qemu/src/linux-5.6.11 
set csverb

nmap cc : cscope find c <Space>
nmap cd : cscope find d <Space>
nmap cf : cscope find f <Space>
nmap cg : cscope find g <Space>
nmap cs : cscope find s <Space>
nmap ct : cscope find t <Space>
"----------------------------------------------------------------------------------"
" Taglist environment set 
"----------------------------------------------------------------------------------"
filetype on
nmap <F5> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_WinWidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"----------------------------------------------------------------------------------"
" Source Explore environment set 
"----------------------------------------------------------------------------------"
nmap <F6> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey= "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"----------------------------------------------------------------------------------"
" NERD tree environment set 
"----------------------------------------------------------------------------------"
let NERDTreeWinPos = "left"
nmap <F7> :NERDTreeToggle<CR>
