set nocompatible

set exrc
set secure

set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"set number
"set relativenumber
set number relativenumber "hybrid
set scrolloff=20

filetype off
syntax off

set rtp+=/usr/bin/fzf

call plug#begin()

Plug 'ycm-core/YouCompleteMe'
"Plug 'ternjs/tern_for_vim'
"Plug 'moll/vim-node'
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           fzf fuzzy find                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-P> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           reset vimrc augroup                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       turn off sounds and visuals                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       regexp engine                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 704
  " Current regexp engine is pretty slow.
  " Consider removing it when it becomes faster.
  set regexpengine=1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        gvim sepcific settings                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set background=dark
    colorscheme solarized

    set guifont=Monospace\ 12
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        treat .gradle as groovy                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd vimrc BufEnter *.gradle setf groovy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        NERDTre  settings                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd vimenter * if &filetype ==# 'javascript' || &filetype ==# 'cpp' || &filetype ==# 'c' | NERDTree | endif
let NERDTreeQuitOnOpen=0
nnoremap <leader>nd :NERDTree<CR>
nnoremap <leader>ndf :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          TERN settings                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        YouCompleteMe settings                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_auto_hover=''

let g:ycm_goto_buffer_command = 'vertical-split'
"let g:ycm_goto_buffer_command = 'split'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

" let g:ycm_cache_omnifunc = 1 // default 1

let g:ycm_min_num_of_chars_for_completion = 3 " default 1
let g:ycm_min_num_identifier_candidate_chars = 3 " default 2

let g:ycm_filetype_whitelist = { 'h': 1,'cpp' : 1, 'c' : 1, 'javascript' : 1 }
"let g:ycm_filetype_whitelist = { 'h': 1,'cpp' : 1, 'c' : 1 }
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_server_log_level = 'error'

nnoremap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gu :YcmCompleter GoToCallers<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
