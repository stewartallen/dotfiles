set nocompatible "Not vi compativle (Vim is king)

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" Github repos
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'samsonw/vim-task'
Bundle 'altercation/vim-colors-solarized'

" Programming languages:
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-markdown'
Bundle 'elzr/vim-json'
Bundle 'klen/python-mode'
Bundle 'othree/javascript-libraries-syntax.vim'

filetype plugin indent on   " required for vundle

" Syntax and indent
syntax enable " Turn on syntax highligthing
colorscheme solarized
set background=dark

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
else
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
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

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END

"ctags
set tags=./tags;/

" OmniCppComplete
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

" Tagbar
nmap <F8> :TagbarToggle<CR>

" fugitive
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> | endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" vim-json
autocmd FileType json setlocal conceallevel=0

" nerdcommenter
map <C-\> <leader>c<space>
