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
Plugin 'junegunn/indentLine' " display identation levels
Plugin 'kien/ctrlp.vim' " fuzzy file matcher, open with <c-p>
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux' " vim-tmux integration
Plugin 'gabesoft/vim-ags' " integrates the silver searcher 
Plugin 'airblade/vim-gitgutter' " show git diff
Plugin 'craigemery/vim-autotag' " automatically update tags

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" choose and configure color scheme
let g:seoul256_background = 235
colorscheme apprentice
set background=dark

" nmap <S-Enter> O<Esc>
nmap <CR> i<CR><Esc>

" go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>


let g:airline#extensions#tabline#fnamemod = ':t'
set number

" disable arrow movement, resize splits instead
noremap <Up> :resize +2<CR>
noremap <Down> :resize -2<CR>
noremap <Left> :vertical resize +2<CR>
noremap <Right> :vertical resize -2<CR>

runtime macros/matchit.vim

" redraw vim background 
set t_ut=

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

" open file under cursor in a new tab
" disable for now since it interferes with ctags
noremap <Space>o <c-w>gf

" comment out block of code by pressing twice on slash key in visual mode
vmap // :s:^://:<CR>
vmap \\ :s:^//::<CR>
vmap " :s/^/" /<CR>
vmap ' :s/^" //<CR>

" set clipboard=unnamedplus

" navigate splits like a sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" more natural splitting
set splitbelow
set splitright

" vimux key bindings
nnoremap <Space>r :VimuxPromptCommand<CR>
nnoremap <Space>j :VimuxRunLastCommand<CR>

nnoremap <c-o> :Ags 
nnoremap <c-w> :w<CR>

" highlight search results
set hlsearch

" configure folds
set foldmethod=syntax
set foldlevel=99

" open definition in new tab
nnoremap <c-N> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" insert mode
imap <c-d> <Left><Del>
