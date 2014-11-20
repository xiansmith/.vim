set nocompatible

syntax enable

set nobackup
set nowritebackup
set noswapfile 


set term=ansi
set t_Co=256
set viminfo='10,\"100,:20,%,n~/.viminfo
" the following line sets tabs to 4 spaces.
set ts=4
" the following line adds line number to the text.
"set nu
" the following line activates the syntax highlighting.
syntax on
" the following line says to vim to highlight the searched words.
set hlsearch
" the following line says to vim to execute incremental search.
set incsearch
" the following line enables the use of the mouse.
"set mouse=a
" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END
