set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


color space-vim-dark 
set background=light  
syntax on 
set number 
set cindent 
set backspace=indent,eol,start 
:set expandtab 
:set noundofile
set guifont=Courier_new:h14:b:cDEFAULT
set tabstop=4 
set shiftwidth=4 
set incsearch
set hlsearch 
set wildmenu              " Vim 命令行提示
set nobackup              " 不生成临时文件
set noswapfile            " 不生成 swap 文件
set autoread              " 自动加载外部修改
set autowrite             " 自动保存
highlight Comment ctermfg=6 guifg=darkyellow

function! MySys()
  if has("win16") || has("win32") || has("win64") || has("win95")
    return "windows"
  elseif has("unix")
    return "linux"
  endif
endfunction
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
if MySys() == "windows"
  set termencoding=chinese
  set fileencoding=chinese
elseif MySys() == "linux"
  let &termencoding=&encoding
  set fileencodings=utf-8,gbk,ucs-bom,cp936
endif
if exists("&ambiwidth")
    set ambiwidth=double
endif
" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>
imap <C-B> <Left>
imap <C-F> <Right>
"NERDTree快捷键
nmap <F3> :NERDTree  <CR>
set langmenu=zh_CN.UTF-8
language messages zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

