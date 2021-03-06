"echom ">^.^<"

set nocompatible
filetype off



"set lines=38 columns=120                          "指定窗口大小，lines为高度，columns为宽度
"此处规定Vundle的路径
"set rtp+=~/.vim/bundle/Vundle.vim/

"call vundle#begin()
call plug#begin('~/.vim/plugged')

"Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tomasr/molokai'
"Plug 'Valloric/YouCompleteMe'
Plug 'cespare/vim-toml'
"Plug 'Shougo/unite.vim'


Plug 'tpope/vim-fugitive' "-git管理工具
Plug 'mattn/webapi-vim'  "-些网址的高亮现
Plug 'luochen1990/rainbow' "-括号层次不同颜色现实
Plug 'godlygeek/tabular'   "-类似格式化"
Plug 'tpope/vim-surround'  "-在选择文本外围设置操作"
Plug 'tpope/vim-repeat'    "-重复插件的操作"
Plug 'rhysd/conflict-marker.vim'  "git pull 冲突高亮现实
Plug 'jiangmiao/auto-pairs'       "-括号自动匹配
Plug 'terryma/vim-multiple-cursors'  "-多个光标操作
Plug 'vim-scripts/sessionman.vim'  "让vim有session
Plug 'vim-airline/vim-airline'       "-漂亮的状态栏
Plug 'vim-airline/vim-airline-themes'       "-漂亮的状态栏主题

Plug 'powerline/fonts'         "自体
"Plug 'bling/vim-bufferline'    "状态栏现实缓冲区
Plug 'easymotion/vim-easymotion'  "vim更好的移动方式
Plug 'mbbill/undotree'           "显示回退的树桩图
Plug 'flazz/vim-colorschemes'     "可以选择配色
Plug 'mhinz/vim-signify'         
"Plug 'tpope/vim-abolish.git'
Plug 'osyo-manga/vim-over'     "将vim的命令行改成shell类似的
Plug 'gcmt/wildfire.vim'       "要括号外的括号进攻
Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/vim-auto-save'
Plug 'Shougo/denite.nvim'

"-------------  code ---------------- 
Plug 'roxma/nvim-completion-manager' "补全件
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"-------------  python plugin---------------- 
Plug 'davidhalter/jedi-vim', {'for': 'python'}
"-------------  rust plugin---------------- 
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'roxma/nvim-cm-racer'
"Plug 'wsdjeg/FlyGrep.vim'

call plug#end()
"call vundle#end()

filetype on "启用文件类型侦测
filetype plugin on  "针对不同的文件类型加载对应的插件
filetype plugin indent on   "启用缩进

set shortmess=atI "去掉欢迎页面
set cursorline "突出显示当前行
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
set ignorecase
set nowrap "设置不折叠行
"set history=1000

"set backspace=2 "设置退格键可用

"set hidden
set scroll=10

"------------- 补全设置 ---------------- 
set wildmenu
set wildmode=list:longest,full

"------------- 鼠标设置 ---------------- 
set mouse=a "启用鼠标
set mousehide "在打字的时候隐藏鼠标j"

"------------- 编码设置 ----------------" 
"set encoding=utf-8 "设置内部编码
"set fileencoding=utf-8

"----------基本设置-----------------
set background=dark         " Assume a dark background
"set background=light

" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <leader>bg :call ToggleBG()<CR>
syntax enable
"colorscheme molokai
colorscheme solarized
"colorscheme desert

let g:solarized_termcolors=256

"----------键盘映射-----------------
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <c-d> <esc>ddi

"------------- 切换tab  ---------------- 
nnoremap <leader>a :tabp<cr>
nnoremap <leader>d :tabn<cr>
nnoremap <leader>w :tabc<cr>

"常用拼写纠正
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@ chenenjiejiang@gmail.com
iabbrev ccopy Copyright 2016 chenenjie,all right reserved.
iabbrev -- "-------------  ----------------

"给选定的字段加上双引号(有问题)
vnoremap <leader>" xi"<esc>pa"<esc>

"augroup testgroup
    "autocmd BufWrite * :echom "Foo"
    "autocmd BufWrite * :echom "Bar"
"augroup END

"augroup testgroup
    "autocmd!
    "autocmd BufWrite * :echom "Baz"
"augroup END

onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>
"
" " 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>
nnoremap "0p <leader>p

vnoremap < <gv
vnoremap > >gv

"find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}(.*\|$)<CR>

cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

vnoremap . :normal .<CR>
map zl zL
map zh zH

nnoremap <Space> :
vnoremap <Space> :

inoremap jk <ESC>
"inoremap <ESC> <nop>

"todo paste when insert
inoremap <c-v> <ESC>pi

inoremap <c-f> <right>
inoremap <c-e> <end>
inoremap <c-a> <home>

if maparg('<C-l>', 'n') ==# '' | nnoremap <silent> <C-l> :nohlsearch<CR><C-l> | endif

"nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"----------状态条-------------------
"set statusline=%f
"set statusline+=\ --
"set statusline+=type:
"set statusline+=%y
"set statusline+=%=
"set statusline+=%l
"set statusline+=/
"set statusline+=%L

"----------unite.vim配置------------
nnoremap <C-h> :Denite buffer file file_rec -mode=normal<CR>


"call denite#custom#map(
      "\ 'insert',
      "\ '<Down>',
      "\ '<denite:move_to_next_line>',
      "\ 'noremap'
      "\)

"call denite#custom#map(
      "\ 'insert',
      "\ '<Up>',
      "\ '<denite:move_to_previous_line>',
      "\ 'noremap'
      "\)

"----------rust配置-----------------
""开启rust的自动reformat的功能
let g:rustfmt_autosave = 0
""手动补全和定义跳转

""" 在normal 模式下, 敲 <leader>jd 跳转到定义或声明(支持跨文件)
"nnoremap <leader>jk :YcmCompleter GoToDefinitionElseDeclaration<CR>
""" 在 Insert 模式下, 敲 <leader>; 补全
inoremap <leader>; <C-x><C-o>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

"------------- nerdtree文件树插件 ---------------- 
nnoremap <f3> :NERDTreeToggle<CR>
"如果只剩下文件树自动退出
augroup nerdtree_command
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end



"function! MyListener(event)
    "echom "foj"
"endfunction

"call g:NERDTreePathNotifier.AddListener("init", "MyListener")

"------------- vundle插件管理插件 ---------------- 
nnoremap <leader><F12> :PluginInstall!<CR>


"----------rainbow配置------------------------
"let g:rainbow_active = 1
nnoremap <leader>c( :RainbowToggle<CR>


"------------- airline配置 ---------------- 
let g:airline_powerline_fonts = 1 

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1

"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif

  " unicode symbols
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"------------- sessionman工作区配置 ---------------- 
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>

"------------- fugitive git插件的配置 ---------------- 
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gu :Gpull<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR> 
endif

"------------- 设置自动保存  ---------------- 
"let g:auto_save = 1

"-------------  python mode 设置---------------- 
"augroup python_mode
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"augroup end

"let g:pymode_lint_checkers = ['pyflakes']
"let g:pymode_trim_whitespaces = 0
"let g:pymode_options = 0
"let g:pymode_rope = 0

"function! ENJIE(word)
    "let key = 'grep -n -r '.a:word." ".getcwd()
    "execute key
"endfunction

function! SearchWorkspace(word)
    let key = 'vimgrep /'.a:word.'/gj **/*.*'
    execute key
endfunction

"-------------  python mode ---------------- 
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"


"-------------  rust mode  ---------------- 
let g:racer_experimental_completer = 1
"racer complete
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
"languageclient complete
"au FileType rust nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"au FileType rust nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"au FileType rust nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"-------------  language server  ---------------- 

set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
"let g:LanguageClient_changeThrottle = 0.5

"------------- python3 plugin avaiable  ---------------- 
"in windows
"let g:python3_host_prog='E:\software\python36\python3.exe'


"-------------  syntastic setting ---------------- 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"-------------  completion setting ---------------- 
"use <enter> chose complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"-------------  全局搜索  ---------------- 
"command! -nargs=? Say call ENJIE('<args>')
command! -nargs=1 Fuck call SearchWorkspace('<args>')
