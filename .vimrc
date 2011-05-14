set nocompatible

"----------------------------------------
" ユーザーランタイムパス設定
"----------------------------------------
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"ランタイムパスを通す必要のあるプラグインを使用する場合、
"$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
"例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
"set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" システム設定
"----------------------------------------
"
"ファイルの上書きの前にバックアップを作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup

"バックアップ/スワップファイルを作成しない
set nobackup

if version >= 703
  "再読込、vim終了後も継続するアンドゥ(7.3)
  set undofile
  "アンドゥの保存場所(7.3)
  set undodir=$MY_VIMRUNTIME
endif

set noswapfile

"クリップボードを共有
set clipboard+=unnamed

"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal

"ヒストリの保存数
set history=100

"日本語の行の連結時には空白を入力しない
set formatoptions+=mM

"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

"コマンドライン補完するときに強化されたものを使う
set wildmenu

"マウスを有効にする
if has('mouse')
  set mouse=a
endif

"pluginを使用可能にする
filetype plugin indent on

"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase

"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

"インクリメンタルサーチ
set incsearch

"検索文字の強調表示
set hlsearch

"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash

"行番号表示
set number

"タブを設定
set ts=2 sw=2 sts=2

"自動的にインデントする
set autoindent

"Cインデントの設定
set cinoptions+=:0

"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=1
set laststatus=2
"コマンドをステータス行に表示
" set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"色テーマ設定
"gvimの色テーマは.gvimrcで指定する
"colorscheme mycolor


""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

