set nocompatible

set exrc
set secure

set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
"set relativenumber

filetype off
syntax off

" Setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'moll/vim-node'
Plugin 'scrooloose/nerdTree'

call vundle#end()

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

" autocmd vimenter * if &filetype ==# 'javascript' || &filetype ==# 'cpp' || &filetype ==# 'c' | NERDTree | endif
nnoremap <leader>nd :NERDTree<CR>
let NERDTreeQuitOnOpen=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          TERN settings                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        YouCompleteMe settings                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

let g:ycm_cache_omnifunc = 1

let g:ycm_min_num_of_chars_for_completion = 3

"let g:ycm_min_num_identifier_candidate_chars = 0

let g:ycm_filetype_whitelist = { 'h': 1,'cpp' : 1,'javascript' : 1 }
"let g:ycm_filetype_whitelist = { 'h': 1,'cpp' : 1 }
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_autoclose_preview_window_after_insertion = 1

"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]

"let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'error'

nnoremap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
