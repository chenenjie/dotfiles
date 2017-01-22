"echom ">^.^<"

set nocompatible
filetype off

"此处规定Vundle的路径
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'Valloric/YouCompleteMe'
Plugin 'cespare/vim-toml'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive' "git管理工具
Plugin 'mattn/webapi-vim'  "一些网址的高亮现
Plugin 'luochen1990/rainbow' "括号层次不同颜色现实
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'rhysd/conflict-marker.vim'  "git pull 冲突高亮现实
Plugin 'jiangmiao/auto-pairs'       "括号自动匹配
Plugin 'terryma/vim-multiple-cursors'  "多个光标操作
Plugin 'vim-scripts/sessionman.vim'  "让vim有session
Plugin 'Lokaltog/powerline'       "漂亮的状态栏
Plugin 'powerline/fonts'         "自体
Plugin 'bling/vim-bufferline'    "状态栏现实缓冲区
Plugin 'easymotion/vim-easymotion'  "vim更好的移动方式
Plugin 'mbbill/undotree'           "显示回退的树桩图
Plugin 'flazz/vim-colorschemes'     "可以选择配色
Plugin 'mhinz/vim-signify'         
Plugin 'tpope/vim-abolish.git'
Plugin 'osyo-manga/vim-over'     "将vim的命令行改成shell类似的
Plugin 'gcmt/wildfire.vim'       "要括号外的括号进攻

call vundle#end()

filetype on "启用文件类型侦测
filetype plugin on  "针对不同的文件类型加载对应的插件
filetype plugin indent on   "启用缩进

set number "设置行号
set smartindent   "启用智能对齐方式
set tabstop=4   "设置Tab键的宽度，可以更改，如：宽度为4
set shiftwidth=4     "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab         "指定按一次backspace就删除shiftwidth宽度
set foldenable                                        "启用折叠
set foldmethod=indent                                 "indent 折叠方式
set expandtab  "将Tab键转换为空格
set nobackup "设置无备份文件
set noswapfile
set foldlevel=99 "设置默认不折叠
set hlsearch "设置搜索高亮
set nowrap "设置不折叠行

set mouse=a "启用鼠标
set t_Co=256 "终端启用256色
set backspace=2 "设置退格键可用

set encoding=utf-8 "设置内部编码
set fileencoding=utf-8
"set fileencodings


"----------基本设置-----------------
set background=dark
colorscheme molokai
"colorscheme solarized
syntax enable


"----------键盘映射-----------------
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>d dd
inoremap <c-d> <esc>ddi



"常用拼写纠正
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@ chenenjiejiang@gmail.com
iabbrev ccopy Copyright 2016 chenenjie,all right reserved.

"给选定的字段加上双引号(有问题)
vnoremap <leader>" xi"<esc>pa"<esc>

augroup testgroup
    autocmd BufWrite * :echom "Foo"
    autocmd BufWrite * :echom "Bar"
augroup END

augroup testgroup
    autocmd!
    autocmd BufWrite * :echom "Baz"
augroup END

onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>
"
" " 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>
nnoremap "0p <leader>p


"----------状态条-------------------
set statusline=%f
set statusline+=\ --
set statusline+=type:
set statusline+=%y
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L

"----------unite.vim配置------------
nnoremap <C-l> :Unite buffer file file_rec<CR>

"----------rust配置-----------------
""开启rust的自动reformat的功能
let g:rustfmt_autosave = 0
""手动补全和定义跳转

""" 在normal 模式下, 敲 <leader>jd 跳转到定义或声明(支持跨文件)
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
""" 在 Insert 模式下, 敲 <leader>; 补全
inoremap <leader>; <C-x><C-o>
nnoremap <leader>z <C-w>h
nnoremap <leader>x <C-w>l

nnoremap <f3> :NERDTreeToggle<CR>

nnoremap <leader><F12> :PluginInstall!<CR>
