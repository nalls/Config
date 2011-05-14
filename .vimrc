set nocompatible

"----------------------------------------
" ���[�U�[�����^�C���p�X�ݒ�
"----------------------------------------
"Windows, unix�ł�runtimepath�̈Ⴂ���z�����邽�߂̂��́B
"$MY_VIMRUNTIME�̓��[�U�[�����^�C���f�B���N�g���������B
":echo $MY_VIMRUNTIME�Ŏ��ۂ̃p�X���m�F�ł��܂��B
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"�����^�C���p�X��ʂ��K�v�̂���v���O�C�����g�p����ꍇ�A
"$MY_VIMRUNTIME���g�p����� Windows/Linux�Ő؂蕪����K�v�������Ȃ�܂��B
"��) vimfiles/qfixapp (Linux�ł�~/.vim/qfixapp)�Ƀ����^�C���p�X��ʂ��ꍇ
"set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" �V�X�e���ݒ�
"----------------------------------------
"
"�t�@�C���̏㏑���̑O�Ƀo�b�N�A�b�v�����Ȃ�
"set writebackup���w�肵�Ă��I�v�V���� 'backup' ���I���łȂ�����A
"�o�b�N�A�b�v�͏㏑���ɐ���������ɍ폜�����B
set nowritebackup

"�o�b�N�A�b�v/�X���b�v�t�@�C�����쐬���Ȃ�
set nobackup

if version >= 703
  "�ēǍ��Avim�I������p������A���h�D(7.3)
  set undofile
  "�A���h�D�̕ۑ��ꏊ(7.3)
  set undodir=$MY_VIMRUNTIME
endif

set noswapfile

"�N���b�v�{�[�h�����L
set clipboard+=unnamed

"8�i���𖳌��ɂ���B<C-a>,<C-x>�ɉe������
set nrformats-=octal

"�q�X�g���̕ۑ���
set history=100

"���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ�
set formatoptions+=mM

"Visual block���[�h�Ńt���[�J�[�\����L���ɂ���
set virtualedit=block

"�J�[�\���L�[�ōs���^�s���̈ړ��\�ɐݒ�
set whichwrap=b,s,[,],<,>

"�o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start

"���⁛�̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
set ambiwidth=double

"�R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��
set wildmenu

"�}�E�X��L���ɂ���
if has('mouse')
  set mouse=a
endif

"plugin���g�p�\�ɂ���
filetype plugin indent on

"�����̎��ɑ啶������������ʂ��Ȃ�
"�������啶���������̗������܂܂�Ă���ꍇ�͑啶������������ʂ���
set ignorecase
set smartcase

"�������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂�
set wrapscan

"�C���N�������^���T�[�`
set incsearch

"���������̋����\��
set hlsearch

"Windows�Ńf�B���N�g���p�X�̋�؂蕶���\���� / ���g����悤�ɂ���
set shellslash

"�s�ԍ��\��
set number

"�^�u��ݒ�
set ts=2 sw=2 sts=2

"�����I�ɃC���f���g����
set autoindent

"C�C���f���g�̐ݒ�
set cinoptions+=:0

"�R�}���h���C���̍��� (gvim��gvimrc�Ŏw��)
set cmdheight=1
set laststatus=2
"�R�}���h���X�e�[�^�X�s�ɕ\��
" set showcmd
"��ʍŌ�̍s���ł������\������
set display=lastline
"Tab�A�s���̔��p�X�y�[�X�𖾎��I�ɕ\������
set list
set listchars=tab:^\ ,trail:~

" �n�C���C�g��L���ɂ���
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"�F�e�[�}�ݒ�
"gvim�̐F�e�[�}��.gvimrc�Ŏw�肷��
"colorscheme mycolor


""""""""""""""""""""""""""""""
"�S�p�X�y�[�X��\��
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "�S�p�X�y�[�X�𖾎��I�ɕ\������
  silent! match ZenkakuSpace /�@/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

