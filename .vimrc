if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"open new-omni-completion function 
filetype plugin indent on
set completeopt=longest,menu

" set line number
set number

"tagList manage
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/home/mrz1996/'
 let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
"let Tlist_Auto_Open=1 “打开vi时自动打开函数列表窗口（才像si嘛）
" let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
let Tlist_GainFocus_On_ToggleOpen=1
map <silent> <F9> :TlistToggle<cr> 


"winmanager manage
" 设置winmanager
" 设置界面分割
let g:winManagerWindowLayout = "TagList|FileExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager快捷键为F8
nmap <silent> <F8> :WMToggle<cr>
"在进入vim时自动打开winmanager
let g:AutoOpenWinManager = 1
"change bckaground
 "syntax enable
  "  syntax on

   " set nu

  "  set t_Co=256

   " set background=dark

  "  colorscheme solarized

" For vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
" vim-scripts repos
Bundle 'bash-support.vim'
Bundle 'perl-support.vim'

" Syntax
Bundle 'asciidoc.vim'
Bundle 'confluencewiki.vim'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
"Bundle 'mako.vim'
Bundle 'moin.vim'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'

" Color

Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'

" Ftplugin
Bundle 'python_fold'

" Indent
"Bundle 'indent/html.vim'
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'mako.vim--Torborg'
Bundle 'gg/python.vim'

" Plugin
Bundle 'The-NERD-tree'
Bundle 'AutoClose--Alves'
Bundle 'auto_mkdir'
Bundle 'cecutil'
Bundle 'fcitx.vim'
Bundle 'FencView.vim'
"Bundle 'FuzzyFinder'
Bundle 'jsbeautify'
Bundle 'L9'
Bundle 'Mark'
Bundle 'matrix.vim'
Bundle 'mru.vim'
Bundle 'The-NERD-Commenter'
"Bundle 'project.vim'
Bundle 'restart.vim'
Bundle 'taglist.vim'
"Bundle 'templates.vim'
"Bundle 'vimim.vim'
Bundle 'ZenCoding.vim'
Bundle 'css_color.vim'
Bundle 'hallettj/jslint.vim'

filetype plugin indent on "

