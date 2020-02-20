
"================================================================================
"|                                                                              |
"|              ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗ ██╗  ██╗                |
"|              ██║   ██║██║████╗ ████║██╔══██╗██╔═══██╗╚██╗██╔╝                |
"|              ██║   ██║██║██╔████╔██║██████╔╝██║   ██║ ╚███╔╝                 |
"|              ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║   ██║ ██╔██╗                 |
"|               ╚████╔╝ ██║██║ ╚═╝ ██║██████╔╝╚██████╔╝██╔╝ ██╗                |
"|                ╚═══╝  ╚═╝╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝                |
"|                                                                              |
"|------------------------------------------------------------------------------|
"|                            VIM 的开箱即用配置包                              |
"================================================================================



"================================================================================
"= Vundle插件管理配置
"================================================================================

    set nocompatible              " be iMproved, required
    filetype off                  " required

    "配置rutime目录包含 Vundle 和 initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    "alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    "用 Vendle 管理 Vendle
    Plugin 'gmarik/Vundle.vim'


"================================================================================
"= 插件
"================================================================================

    "----------------------------------------------------------------------------
    "- VimBox的扩展，安全管快速关闭buffer等
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/chawuciren/vim-box-plugin.git'

    "----------------------------------------------------------------------------
    "- NERDTree树状目录
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/scrooloose/nerdtree.git'
    "自动运行
    "autocmd VimEnter * NERDTreeToggle
    "快捷键
    map <C-n> :NERDTreeToggle<CR>
    "关闭窗口时关闭
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif"""")""))
    "设置窗口宽度
    let NERDTreeWinSize=28

    "----------------------------------------------------------------------------
    "- TagBar显示关键字
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/majutsushi/tagbar.git'
    let g:tagbar_ctags_bin='/usr/bin/ctags'
    let g:tagbar_width=24
    "autocmd VimEnter * TagbarToggle

    "----------------------------------------------------------------------------
    "- AirLine窗口美化
    "----------------------------------------------------------------------------
    "需要安装powerline字体"
    Plugin 'https://github.com/bling/vim-airline.git'
    "颜色
    set t_Co=256
    set laststatus=2
    let g:airline_detect_whitespace          = 0 "关闭空白符检测
    let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
    let g:airline_theme                      = "bubblegum" "设定主题
    "显示Buf的序号
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_powerline_fonts = 1

    "----------------------------------------------------------------------------
    "- AirLine主题
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/vim-airline/vim-airline-themes.git'

    "----------------------------------------------------------------------------
    "- CtrlP 快速定位
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/kien/ctrlp.vim.git'

    "----------------------------------------------------------------------------
    "- Neocomplcache 代码提示自动补全
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/Shougo/neocomplcache.vim.git'

    " Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> tlt <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return "\<C-n>".neocomplcache#smart_close_popup()
    endfunction

    " <TAB>: completion.
    inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<TAB>"

    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

    "----------------------------------------------------------------------------
    "- AutoPairs 自动补全括号
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/jiangmiao/auto-pairs.git'

    "----------------------------------------------------------------------------
    "- Ack 全目录搜索
    "----------------------------------------------------------------------------
    "系统中需要安装Ack"
    Plugin 'https://github.com/mileszs/ack.vim.git'

    "----------------------------------------------------------------------------
    "- DoxygenToolkit 注释
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'

    let g:DoxygenToolkit_briefTag_pre="@brief "
    let g:DoxygenToolkit_paramTag_pre="@param "
    let g:DoxygenToolkit_returnTag="@return "
    let g:DoxygenToolkit_authorTag = "@author "
    let g:DoxygenToolkit_blockHeader=""
    let g:DoxygenToolkit_blockFooter=""
    let g:DoxygenToolkit_authorName="chawuciren"
    let g:DoxygenToolkit_licenseTag="1.0"

    "----------------------------------------------------------------------------
    "- vim-go Golang插件
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/fatih/vim-go.git'
    let g:go_fmt_autosave = 0
    let g:go_play_open_browser = 0

    "----------------------------------------------------------------------------
    "- vim-phpfmt PHP代码格式化
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/chawuciren/vim-phpformat.git'

    "不在保存的时候自动格式化
    let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 0)
    "定义格式化规则
    let g:phpfmt_config = expand('<sfile>:p:h') . '/.vim/.phpfmt.ini'
    "环境中的PHP可执行文件路径
    let g:phpfmt_php_path = 'php'
    "let g:phpfmt_prepasses_list = "AutoPreincrement,JointToImplode"
    "let g:phpfmt_passes_list = "ReturnNull"
    "Enable the mapping by default (<leader>pcd)
    let g:phpfmt_enable_default_mapping = 1
    "定义文件类型为.php的文件格式化快捷键
    autocmd FileType php noremap <buffer>  <C-j>f :call PhpFmtFixFile()<CR>

    "----------------------------------------------------------------------------
    "- JsBeautify Javascript代码格式化
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/editorconfig/editorconfig-vim'
    Plugin 'https://github.com/maksimr/vim-jsbeautify.git'

    "格式化.js类型的文件的快捷键
    autocmd FileType javascript noremap <buffer>  <C-j>f :call JsBeautify()<cr>
    "格式化.json类型的文件的快捷键
    autocmd FileType json noremap <buffer> <C-j>f :call JsonBeautify()<cr>
    "格式化.jsx类型的文件的快捷键
    autocmd FileType jsx noremap <buffer> <C-j>f :call JsxBeautify()<cr>
    "格式化.html类型的文件的快捷键
    autocmd FileType html noremap <buffer> <C-j>f :call HtmlBeautify()<cr>
    "格式化.css类型的文件的快捷键
    autocmd FileType css noremap <buffer> <C-j>f :call CSSBeautify()<cr>
    "格式化.go类型的文件的快捷键
    autocmd FileType go noremap <buffer> <C-j>f :GoFmt<cr>

    "----------------------------------------------------------------------------
    "- Vim-multiple-cursors 多光标选择
    "----------------------------------------------------------------------------
    "快捷键冲突，暂时关闭
    Plugin 'https://github.com/terryma/vim-multiple-cursors'

    "----------------------------------------------------------------------------
    "- 支持Xml/Html的标签闭合
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/othree/xml.vim'

    "----------------------------------------------------------------------------
    "- Vim-vue 支持vue的高亮
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/posva/vim-vue'

    "----------------------------------------------------------------------------
    "- vim-easymotion 快速移动
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/easymotion/vim-easymotion'
    map <C-j>s <Plug>(easymotion-prefix)

    "----------------------------------------------------------------------------
    "- 让tagbar支持Protobuf
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/uarun/vim-protobuf'

    "----------------------------------------------------------------------------
    "- Protobuf 的语法高亮
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/tenfyzhong/tagbar-proto.vim'

    "----------------------------------------------------------------------------
    "- 缩进美化插件
    "----------------------------------------------------------------------------
    Plugin 'https://github.com/Yggdroot/indentLine'




    "----------------------------------------------------------------------------
    "- 所有插件的引入必须在后面这句话之前
    "----------------------------------------------------------------------------
    call vundle#end()
    filetype plugin indent on

    "后面是一些插件的备选配置
    "
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this lined


"================================================================================
"= 配色方案
"================================================================================

    syntax enable
    let g:solarized_termcolors=256
    set t_Co=256
    set background=dark

    "配色方案名称，所有配色方案放在colors目录下，填写对应名称即可
    "colorscheme Tomorrow-Night
    colorscheme Tomorrow-Night-Eighties


"================================================================================
"= 编辑器配置
"================================================================================

    "显示光标当前位置
    set ruler
    "高亮显示当前行/列
    set cursorline
    set cursorcolumn
    "高亮显示搜索结果
    set hlsearch
    "禁止折行
    "set nowrap
    "设置文件编码兼容gbk等格式
    let &termencoding=&encoding
    set fileencodings=utf-8,gb18030,gbk,gb2312,big5
    "设置折叠方式
    set fdm=indent
    "设置搜索忽略大小写
    set ignorecase
    "设置背景色，每种配色有两种方案，一个light、一个dark "
    set background=dark
    "默认不生成备份文件
    set nobackup
    "显示行号
    set nu
    "打开语法高亮
    syntax on
    "设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致) "
    "set smartindent
    set autoindent
    "在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 "
    set backspace=indent,eol,start 
    "制表符占4个空格
    set tabstop=4 
    "将tab换成4个空格
    set expandtab
    "一次退格删除4个空格
    set softtabstop=4
    "在行首按Tab加入shiftwidth个空格，否则加入tabstop个空格
    set smarttab
    "默认缩进4个空格大小 "
    set shiftwidth=4
    "增量式搜索"
    set incsearch
    "高亮搜索 "
    set hlsearch
    "显示Tab符号"
    "set list listchars=tab:\|-,trail:-
    set list listchars=tab:\|\ ,trail:\ 
    "设置标尺
    set colorcolumn=120

    "根据不同扩展名切换缩进
    autocmd FileType html :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType css :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType js :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType vue :setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType scss :setlocal tabstop=2 softtabstop=2 shiftwidth=2

"================================================================================
"= 结束
"================================================================================
