if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
	  let &t_Sf = "\<Esc>[3%p1%dm"
	  let &t_Sb = "\<Esc>[4%p1%dm"
  else
	  let &t_Sf = "\<Esc>[3%dm"
	  let &t_Sb = "\<Esc>[4%dm"
  endif
endif

execute pathogen#infect()
syntax on
filetype plugin indent on

" use four spaces for indentation:w
set tabstop=4
set shiftwidth=4
set expandtab


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " color scheme
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ syntax highlighting
Plugin 'dracula/vim' " color scheme
Plugin 'vim-airline/vim-airline' " status line
Plugin 'vim-airline/vim-airline-themes' " status line themes
Plugin 'w0ng/vim-hybrid' " color scheme
Plugin 'sickill/vim-monokai' " color scheme
Plugin 'mkitt/tabline.vim' " tab labels
Plugin 'tpope/vim-sensible.git' " some vim default
Plugin 'junegunn/rainbow_parentheses.vim' " Rainbow parentheses 
Plugin 'sjl/badwolf' " color scheme 
Plugin 'jnurmine/Zenburn' " color scheme
Plugin 'romainl/Apprentice' " color scheme
Plugin 'junegunn/seoul256.vim' " color sheme
Plugin 'junegunn/vim-slash' " clear search highlight when cursor is moved
Plugin 'junegunn/indentLine' " display identation levels
Plugin 'kien/ctrlp.vim' " fuzzy file matcher, open with <c-p>

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" choose and configure color scheme
let g:seoul256_background = 235
colorscheme apprentice
set background=dark

" nmap <S-Enter> O<Esc>
nmap <CR> i<CR><Esc>

" go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <c-j> :tabprevious<CR>
nnoremap <c-k> :tabnext<CR>


let g:airline#extensions#tabline#fnamemod = ':t'
set number

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

runtime macros/matchit.vim

" redraw vim background 
set t_ut=

" highlight matched text, effective when doing a search
set hlsearch

" highlight current line
set cursorline

" allow at least 11 lines to be visible when scrolling
set scrolloff=11

" toggle rainbow parenthesis
autocmd BufReadPost * RainbowParentheses

" ctrlp configuration - open file in a new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")' : ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")' : ['<cr>'],
    \ }
