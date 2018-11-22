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
" Plugin 'airblade/vim-gitgutter' " show git diff
Plugin 'craigemery/vim-autotag' " automatically update tags
Plugin 'haya14busa/incsearch.vim' " incrementally hightligh all searches
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
" Plugin 'w0rp/ale'
Plugin 'ddrscott/vim-side-search'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'fatih/vim-go'
Plugin 'gfontenot/vim-xcode'

" show indentations, triggered by <leader>ig
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Raimondi/delimitMate' " auto brackets

" Plugin 'plasticboy/vim-markdown'

" search and load local vimrc files
Plugin 'embear/vim-localvimrc'

Plugin 'eraserhd/vim-ios'
Plugin 'msanders/cocoa.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'djoshea/vim-autoread'
Plugin 'b4winckler/vim-objc'

" great idea, but so slow
" Plugin 'itchyny/vim-cursorword'

" no working either
" https://medium.com/@xanderdunn/replace-xcode-with-neovim-c81f89a50a23
" Plugin 'qstrahl/vim-Matchmaker'

Plugin 'Chiel92/vim-autoformat'
Plugin 'zefei/simple-dark' " colorscheme
Plugin 'yearofmoo/Vim-Darkmate' " colorscheme
Plugin 'zeis/vim-kolor' " colorscheme
Plugin 'dracula/vim' " colorscheme
Plugin 'reedes/vim-colors-pencil' " colorscheme
Plugin 'pbrisbin/vim-colors-off' " colorscheme

Plugin 'itchyny/lightline.vim' " statusline
Plugin 'mhinz/vim-startify'
Plugin 'justinmk/vim-sneak'

Plugin 'junegunn/vim-pseudocl'
" Plugin 'junegunn/vim-oblique' " seems to be too slow

Plugin 'goerz/ipynb_notedown.vim'
"Plugin 'justinmk/vim-syntax-extra' " better c highligniting

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
Glaive codefmt google_java_executable="java -jar /Users/aautushka/bin/google-java-format-1.6-all-deps.jar"

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" choose and configure color scheme
let g:seoul256_background = 235
" colorscheme apprentice
" colorscheme PaperColor
" colorscheme seoul256
" colorscheme kolor
colorscheme dracula
" colorscheme pencil
" colorscheme off
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
set clipboard=unnamed

" navigate splits 
nnoremap <c-h> <c-w>w

" more natural splitting
set splitbelow
set splitright

" vimux key bindings
nnoremap <Leader>r :VimuxPromptCommand<CR>
nnoremap <Leader>j :VimuxRunLastCommand<CR>
nnoremap <Leader>c :VimuxInterruptRunner<CR>
nnoremap <Space> :wa<CR>:VimuxRunLastCommand<CR>

" nnoremap <c-i> :SideSearch 

" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
nnoremap <Leader><Leader>s :SideSearch<space>
nmap <Leader>s :SideSearch<space>
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

" navigate in a wrapped line
nmap j gj
nmap k gk

" fzf configuration
nmap <c-p> :FZF<CR>
nmap <Leader>b :BLines <CR>

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

nnoremap <silent> <Leader>l :Lines <CR>
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" look for word under cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <C-g> :Rg<Cr>

" do not look in files names when doing fzf with :Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --follow --color=always  --smart-case
  \ -g "*.{cc,cpp,h,hh,cxx,m,mm,cc,hxx,java}"
  \ -g "!Pods" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   g:rg_command. shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

set grepprg=rg\ --vimgrep

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
" inoremap <expr> {<Enter> <SID>CloseBracket()

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

command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" enable syntax higlighting for metal shading language (kind of like cpp)
autocmd BufEnter *.metal :setlocal filetype=cpp

" load .vimrc from the current directory
set exrc

" local vimrc
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

" fix c++ lambda indentation
let c_no_curly_error = 1
set cindent
set smartindent

set ignorecase
set smartcase

nnoremap <Leader>cf :ClangFormat<CR>

" center screen after jumping to a mark
nnoremap <expr> ' "'" . nr2char(getchar()) . "zz"
nnoremap <expr> ` "`" . nr2char(getchar()) . "zz"


" temporarily highlight the line jumped to
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return
  endif
  let diff = g:last_pos - cur_pos
  if diff > 1 || diff < -1
    set cul
  else
    set nocul
  endif
  let g:last_pos = cur_pos
endfunction
autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0

" search word under cursor, hightligh matches but do not move
nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

nmap G Gzz

let g:cursorword_highlight = 1

" Autoformat
" autocmd FileType objc,objcpp autocmd InsertLeave <buffer> :silent Autoformat

" vim-oblique
" let g:oblique#incsearch_highlight_all = 1

" improve performance 
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
" set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" vim-sneak configuration
hi! link Sneak Search
let g:sneak#use_ic_scs = 1

augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,objc AutoFormatBuffer clang-format
  " autocmd BufRead *.cc *.cpp *.h *.hpp *.cxx *.c AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" cursorline style
" hi CursorLine term =bold cterm=bold guibg=Grey40 ctermbg=234
