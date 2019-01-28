" dein Scripts
if &compatible
 set nocompatible
endif

" dein.vim directory
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" If there is no directory, "git clone"
if !isdirectory(s:dein_repo_dir)
  execute 'git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" Begin settings!
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/unite.vim')

 " html
 call dein#add('othree/html5.vim')

 " CSS
 call dein#add('cakebaker/scss-syntax.vim')

 " JavaScript
 call dein#add('othree/yajs.vim')
 call dein#add('mxw/vim-jsx')

 " emmet
 call dein#add('mattn/emmet-vim')

 " IDE
 call dein#add('scrooloose/nerdtree')

 " Indent 
 call dein#add('nathanaelkane/vim-indent-guides')

 " Incsearch
 call dein#add('haya14busa/incsearch.vim')

 " Text
 call dein#add('t9md/vim-textmanip')

 " ALE
 " Syntax checking
 if has('job') && has('channel') && has('timers')
  call dein#add('w0rp/ale')
 else
  call dein#add('vim-syntastic/syntastic')
 endif
 
 " Finish settings!
 call dein#end()
 call dein#save_state()
endif

" Plugin installation check
if dein#check_install()
  call dein#install()
endif

" Backspace
set backspace=indent,eol,start

" NERDTree
map <C-f> :NERDTreeToggle<CR>

" vim-jsx
let g:jsx_ext_required = 0

" Emmet 
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_settings = { 'indentation': ' ', 'css' : { 'snippets' : { 'd:f' : "display:f" } } }

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
colorscheme default

" Indent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

" Incsearch
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)

" Textmanip
xmap <S-j> <Plug>(textmanip-move-down)
xmap <S-k> <Plug>(textmanip-move-up)
xmap <S-h> <Plug>(textmanip-move-left)
xmap <S-l> <Plug>(textmanip-move-right)

" Keymap
noremap <C-h> ^
noremap <C-l> $

imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" Line number
set number

" No swapfile
set noswapfile

" ALE
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'css': ['stylelint'],
\  'scss': ['stylelint'],
\}
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
 " エラーと警告の一覧を見るためにウィンドウを開いておく
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
highlight ALEWarning ctermbg=DarkMagenta

filetype plugin indent on
syntax enable
