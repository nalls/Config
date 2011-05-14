
colorscheme slate
set columns=120
set lines=40

"�R�}���h���C���̍��� (gvim��gvimrc�Ŏw��)
set cmdheight=1
set laststatus=2

"IME�̏�Ԃ��J���[�\��
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

"�t�H���g�ݒ�
"�t�H���g�͉p�ꖼ�Ŏw�肷��Ɩ�肪�N���ɂ����Ȃ�܂�
if has('xfontset')
"  set guifontset=a14,r14,k14
elseif has('unix')

elseif has('mac')
"  set guifont=Osaka-Mono:h14
elseif has('win32') || has('win64')
  set guifont=Ricty:h12:cSHIFTJIS
  set guifontwide=Ricty:h12:cSHIFTJIS
endif

"����p�t�H���g
if has('printer')
  if has('win32') || has('win64')
"    set printfont=MS_Mincho:h12:cSHIFTJIS
"    set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif


