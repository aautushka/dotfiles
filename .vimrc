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
" Plugin 'octol/vim-cpp-enhanced-highlight' " C++ syntax highlighting EATS CPU
" Plugin 'vim-airline/vim-airline' " status line EATS CPU 
" Plugin 'vim-airline/vim-airline-themes' " status line themes EATS CPU
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-sensible.git' " some vim defaults
Plugin 'junegunn/rainbow_parentheses.vim' " Rainbow parentheses 
Plugin 'romainl/Apprentice' " color scheme
Plugin 'junegunn/seoul256.vim' " color sheme
" Plugin 'junegunn/indentLine' " display identation levels EATS CPU
Plugin 'tpope/vim-surround' 
Plugin 'benmills/vimux' " vim-tmux integration
Plugin 'gabesoft/vim-ags' " integrates the silver searcher 
Plugin 'airblade/vim-gitgutter' " show git diff
Plugin 'craigemery/vim-autotag' " automatically update tags
Plugin 'easymotion/vim-easymotion' 
Plugin 'haya14busa/incsearch.vim' " incrementally hightligh all searches
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'tpope/vim-unimpaired' " some usefule key bindings
Plugin 'tpope/vim-commentary' " comment code
Plugin 'tpope/vim-repeat' " . to work with plugins
Plugin 'tpope/vim-sleuth' " heuristically set buffer options
Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim' " fuzzy file matcher better than ctrlp
Plugin 'NLKNguyen/papercolor-theme' " colorscheme PaperColor
Plugin 'kshenoy/vim-signature' " show marks automatically
Plugin 'tpope/vim-fugitive' " git integration : EATS CPU
Plugin 'tpope/vim-endwise' 
Plugin 'majutsushi/tagbar' " ctags viewer
Plugin 'w0rp/ale'
Plugin 'ddrscott/vim-side-search'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'fatih/vim-go'

" show indentations, triggered by <leader>ig
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" choose and configure color scheme
let g:seoul256_background = 235
colorscheme apprentice
" colorscheme PaperColor
" colorscheme seoul256
set background=dark

" nmap <S-Enter> O<Esc>
nmap <CR> i<CR><Esc>

" go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <c-j> :bprevious<CR>
nnoremap <c-k> :bnext<CR>
set hidden " allow switching from an unsaved buffer

set number

" disable arrow movement, resize splits instead
noremap <Up> :resize +2<CR>
noremap <Down> :resize -2<CR>
noremap <Left> :vertical resize +2<CR>
noremap <Right> :vertical resize -2<CR>

runtime macros/matchit.vim

" allow at least 11 lines to be visible when scrolling EATS CPU
" set scrolloff=15 

" open file under cursor in a new tab
" disable for now since it interferes with ctags
noremap <Space>o <c-w>gf

" comment out block of code by pressing twice on slash key in visual mode
vmap // :s:^://:<CR>
vmap \\ :s:^//::<CR>
vmap " :s/^/" /<CR>
vmap ' :s/^" //<CR>

" set clipboard=unnamedplus

" navigate splits 
nnoremap <c-h> <c-w>w

" more natural splitting
set splitbelow
set splitright

" vimux key bindings
nnoremap <Leader>r :VimuxPromptCommand<CR>
nnoremap <Leader>j :VimuxRunLastCommand<CR>
nnoremap <Leader>c :VimuxInterruptRunner<CR>
nnoremap <Space> :VimuxRunLastCommand<CR>

" nnoremap <c-i> :SideSearch 

" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
nnoremap <Leader><Leader>s :SideSearch 
"  Create an shorter `SS` command
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'
command! -complete=file -nargs=+ Ss execute 'SideSearch <args>'

" or command abbreviation
cabbrev SS SideSearch

" highlight search results
set hlsearch

" configure folds
" foldmethod=syntax looks to be very slow
" set foldmethod=syntax
" set foldlevel=99

" open definition in new tab
nnoremap <c-N> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" insert mode
imap <c-d> <Left><Del>

" Ags: ignore ctags' tags file
let g:ags_agexe='ag --ignore=tags'

" replace standard search with incsearch.vim
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" incsearch-easymotion.vim 
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" navigate in a wrapped line
nmap j gj
nmap k gk

" easymotion configuration
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
nmap <Leader>/ <Plug>(easymotion-sn)

" fzf configuration
nmap <c-p> :FZF<CR>

" rainbow parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd BufReadPost * RainbowParentheses

" tagbar config
nmap <F8> :TagbarToggle<CR>

" side searcher configuration
let g:side_search_splitter = 'new'
let g:side_search_split_pct = 0.6
let g:side_search_prg = 'ag --heading --stats -B1 -A 0'

" work with buffers
nnoremap <c-l> :bd<CR>

" show full path in status line
set statusline+=%F

" highlight max line length
set colorcolumn=100

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Search for files in project root directory (use git root)
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" look for word under cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" do not look in files names when doing fzf with :Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"auto close {
function! s:CloseBracket()
  let line = getline('.')
  if line =~# '^\s*\(struct\|class\|enum\) '
    return "\<Enter>{\<Enter>};\<Esc>O"
  elseif searchpair('(', '', ')', 'bmn', '', line('.'))
    " Probably inside a function call. Close it off.
    return "{\<Enter>});\<Esc>O"
  else
    return "{\<Enter>}\<Esc>O"
  endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

" do not indent private: public: protected: in c++ code
" :help cino-g
" :help cino-h
set cinoptions+=g0

" ale C++ opts
" let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/opt/boost_1_66_0/include'
" let g:ale_cpp_gcc_options = '-std=c++14 -Wall -I/opt/boost_1_66_0/include'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
" do not highlight ale errors - too noisy
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" load .vimrc from the current directory
set exrc

set matchpairs+=<:>

set wildmode=list:longest,full

" https://github.com/junegunn/fzf/wiki/Examples-(vim)#jump-to-tags
" Jump to tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

" Jump to tags in the current buffer
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()


" Search lines in all open vim buffers
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})


" Select buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
