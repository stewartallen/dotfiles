set nocompatible "Not vi compativle (Vim is king)

" Vundle
filetype off" 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle required! 
Plugin 'VundleVim/Vundle.vim'

" Github repos
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'samsonw/vim-task'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rizzatti/dash.vim'
Plugin 'jbgutierrez/vim-better-comments'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'lifepillar/vim-mucomplete'

" Programming languages:
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'klen/python-mode'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'dense-analysis/ale'
Plugin 'vim-yaml-folds'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on   " required for vundle

" Syntax and indent
syntax enable " Turn on syntax highligthing
colorscheme solarized
set background=dark

if has("gui_macvim")
  set guifont=Jetbrains\ Mono:h12
endif

if &diff
  " incase i want different things for vimdiff
  set background=dark
endif

set showmatch  "Show matching bracets when text indicator is over them

" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent

" Some other confy settings
set nu " Number lines
set hls " highlight search
set lbr " linebreak
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Use 2 space instead of tab during format
set expandtab
set shiftwidth=2
set softtabstop=2
autocmd FileType java,c,cpp set shiftwidth=4
autocmd FileType java,c,cpp set tabstop=4

" For vim-sensible, keep all the undo files in the same place
set undodir^=~/.vim/undo

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.o$', '\.d$']

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END

" Tagbar
nmap <F8> :TagbarToggle<CR>

" fugitive
" autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif
" autocmd BufReadPost fugitive://* set bufhidden=delete

" vim-json
autocmd FileType json setlocal conceallevel=0

" nerdcommenter
map <C-\> <leader>c<space>

" neocomplete
let g:neocomplete#enable_at_startup = 1

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" MUcomplete
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion
