syntax on

:imap jj <Esc>
:imap ii <Esc>
set backspace=indent,eol,start

filetype plugin indent on
set tabstop=2

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

:set autoread

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
