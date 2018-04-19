if system("uname") == "Linux"
	execute pathogen#infect()
endif
set nocompatible              " be iMproved, required
filetype off                  " required

if v:progname =~? "evim"
	finish
endif

let $PATH = '/usr/bin:'.$PATH

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomasr/molokai'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'vim-airline/vim-airline'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set encoding=utf-8
set path+=**
set wildmenu
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set nobackup		" keep a backup file
endif
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
	if !has('nvim')
		set ttymouse=xterm2
	endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

	if executable('cquery')
		au User lsp_setup call lsp#register_server({
			\ 'name': 'cquery',
			\ 'cmd': {server_info->['cquery']},
			\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
			\ 'initialization_options': { 'cacheDirectory': '~/cquery/cache' },
			\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
			\ })
	endif

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif
set tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab
colorscheme molokai
hi NonText ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
set number
set relativenumber
set clipboard=unnamed
set foldmethod=syntax

:function FormatFile()
:  let l:lines="all"
:  pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py
:endfunction

if system("uname") == "Linux"
	let g:clang_library_path = '/usr/lib/llvm-6.0/lib'
else
	let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
endif

" Python
let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'

" YouCompleteMe
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
"nnoremap <leader>fi :YcmCompleter FixIt<CR>
"nnoremap <leader>gt :YcmCompleter GetType<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_python_binary_path = '/usr/local/Cellar/python3'
"set tags+=./.tags

" ClangFormat
nnoremap <leader>cf :ClangFormat<CR>

" fzf
"set rtp+=~/.fzf
"set rtp+=/usr/local/opt/fzf

" LLDB
"nmap <M-b> <Plug>LLBreakSwitch
"vmap <F2> <Plug>LLStdInSelected
"nnoremap <F4> :LLstdin<CR>
"nnoremap <F5> :LLmode debug<CR>
"nnoremap <S-F5> :LLmode code<CR>
"nnoremap <F8> :LL continue<CR>
"nnoremap <S-F8> :LL process interrupt<CR>
"nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
"vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

" air0line
set laststatus=2

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" vim-lsp
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'} " icons require GUI
let g:lsp_signs_hint = {'text': '💡'} " icons require GUI
set signcolumn=yes
highlight SignColumn ctermbg=None

" asyncomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_remove_duplicates = 1
set completeopt+=preview
set cot+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
