set number
syntax enable
set termguicolors
colorscheme dank-neon
set autoindent
set tabstop=4
set shiftwidth=4
set viminfo=
set noswapfile
set noundofile
set mouse=a
set clipboard+=unnamed
" <C-c>を完全な<ESC>に
imap <C-c> <ESC>
" TerminalモードでESCを有効にする
tnoremap <silent> <ESC> <C-\><C-n>
" 置換の際にインタラクティブに変更を見れるようにする
set inccommand=split
highlight Normal guibg=none
highlight NonText guibg=none
highlight LineNr guibg=none
