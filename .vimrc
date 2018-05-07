" vim: set foldmethod=marker nolist:
set encoding=utf-8
scriptencoding utf-8

let mapleader='\'   " set leader
let maplocalleader='\'   " set localleader

" set runtimepath {{{
	if &runtimepath !~ "$HOME/dotfiles/.vim"
		let &runtimepath .= ',$HOME/dotfiles/.vim'
	endif
" }}}
" source plugins & plugin settings {{{
	" set the runtime path to include Vundle and initialize
	set rtp+=$HOME/dotfiles/.vim/bundle/Vundle.vim

	
	call vundle#begin()

	let g:vundle#bundle_dir=$HOME.'/dotfiles/.vim/bundle/'

	runtime! plugins.vim                  " list of plugins
	call vundle#end()                     " required

	runtime! plugin_settings.vim		  " plugin-related settings
	filetype plugin indent on             " required
" }}}
" looks, syntax, formatting {{{
	syntax on                             " syntax highlighting
	if has ('termguicolors')
		set termguicolors
	endif

	color wollf				              " colorscheme
	"set t_Co=256
	let python_highlight_all = 1          " python highlighting

	" highlight braces, parens, brackets {{{
		syn match Braces /[{}]/
	" }}}

	" SpecialKeys override CursorLine {{{
	augroup highlighting
		autocmd!
		autocmd VimEnter * call matchadd('Braces', '[{}()\[\]]')
		autocmd VimEnter * call matchadd('SpecialKey', '\s\+$', -1)
		autocmd VimEnter * call matchadd('SpecialKey', '^\s\+', -1) 
		autocmd VimEnter * call matchadd('SpecialKey', '\s\+$', -1)
	augroup END
	" }}}

	set mps+=<:>                          " move between < > with %
	set list							  " whitespace highlighting
	set listchars=tab:\|\•|				  " highlight tabs
	set autoindent                        " set auto-indenting
" }}}
" misc {{{
	set mouse=a																	" enable mouse usage
	set modeline																" enable using modeline
	set modelines=1																" max 1 line modeline
	set concealcursor="nvic"													" disable concealing on current line
	set conceallevel=2
	set lazyredraw																" do not redraw if not necessary
	set textwidth=80															" hard wrap at 80 characters
	set formatoptions+=t														" wrap even if the line already was >80 chars
	set formatoptions+=n
	set hidden                                                                   " hides buffers instead of closing them
	set scrolloff=5                                                              " start scrolling X lines before edge of viewport
	set history=1000                                                             " remember more commands and search history
	set undolevels=1000                                                          " use many muchos levels of undo
	set visualbell                                                               " don't beep
	set laststatus=2                                                             " make the last line where the status is two lines deep so you can see status always
	set tabstop=4                                                                " number of visual spaces per TAB
	set shiftwidth=4                                                             " number of spaces per '>' indent
	set softtabstop=4                                                            " number of spaces for <TAB> in insert mode
	set backspace=indent,eol,start                                               " make that backspace key work the way it should
	set clipboard=unnamed                                                        " set clipboard to unnamed to access the system clipboard under windows
" }}}
" spell settings {{{
	set spelllang=en		" english as default spelllang
	set spellfile=$HOME/dotfiles/.vim/spell/en.utf-8.add
" }}}
" folds {{{
	set foldenable                                                               " enable folding
	set foldlevelstart=2                                                         " 1 nested fold opened by default
	set foldnestmax=10                                                           " 10 nested fold max
	set foldmethod=syntax                                                        " folds based on syntax
	set fillchars=vert:┃             " delimiter of vertical splits (also removes trailing dashes in closed folds)
	let javaScript_fold=1                                                        " JavaScript
	let java_fold=1                                                              " Java
	let cpp_fold=1                                                               " c++
	let php_folding=1                                                            " PHP
	let r_syntax_folding=1                                                       " R
	let vimsyn_folding='af'                                                      " Vim script
" }}}
" splits {{{
	set splitbelow                                                               " open new splits below the current one
	set splitright                                                               " open new splits on the right side of the current one
" }}}
" wrap & linebreak {{{
	if has('linebreak')
		set linebreak
		let &showbreak = '¬ '
		if exists('+breakindent')
			set breakindent
			set breakindentopt=shift:2
		endif
	endif
" }}}
" row numbers (hybrid) {{{
	set number relativenumber
	augroup numbertoggle
	  autocmd!
	  " do not set lines for markdown, tex files
	  let blacklist = ['md', 'markdown', 'tex']
	  autocmd BufEnter,FocusGained,InsertLeave * if index(blacklist, &ft) < 0 | set relativenumber
	  autocmd BufLeave,FocusLost,InsertEnter   * if index(blacklist, &ft) < 0 | set norelativenumber
	augroup ENDset numbertoggle
" }}}
" storing swp, tmp & undo files {{{
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/swap")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/backup")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/undo")

	set directory=$HOME/dotfiles/.vim/tmp/swap
	set backupdir=$HOME/dotfiles/.vim/tmp/backup
	set undodir=$HOME/dotfiles/.vim/tmp/undo
" }}}
" info  {{{
	set autochdir                                                                " sets cd based on current file
	set display+=lastline														 " show as much from last line as possible
	set showcmd                                                                  " show command in bottom bar
	if has("patch-7.4-2201")
		set signcolumn=yes														 " always show gitgutter column (no shifting after editing file)
	endif 
	set cursorline                                                               " highlight current line

	augroup cursorLine
		autocmd!
		" do not show cursorline in unactive windows
		autocmd WinEnter,FocusGained * setlocal cursorline
		autocmd WinLeave,FocusLost   * setlocal nocursorline
	augroup END

	set hlsearch                                                                 " highlight search terms
	set incsearch                                                                " show search matches as you type
	set ignorecase                                                               " ignore case while searching
	set smartcase                                                                " searching - all lowercase: case insensitive, case sensitive otherwise
	set showmode                                                                 " show the current mode
	set ruler                                                                    " show the cursor position all the time
	set showmatch                                                                " automatically show matching brackets
	set title                                                                    " change the terminal's title
	set foldcolumn=0															 " hide fold bar
" }}}
" wildmenu {{{
	set wildmenu                                        " visual autocomplete for command menu
	set wildmode=list:full                              " show all possibilities when tab-completing
	set wildignore=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
	set wildignore+=*.aux,*.out,*.toc,*.fls,*.fdb_latexmk,*.synctex.gz " LaTeX intermediate files
	set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " binary images
	set wildignore+=*.pdf,*.zip,*.so                    " binaries
	set wildignore+=*.spl                               " compiled spelling word lists
	set wildignore+=*.swp,*.bak                         " ignore these
	set wildignore+=*.sw?                               " Vim swap files
	set wildignore+=*.mp3,*.avi,*.mp4                   " multimedia files
" }}}
" shortmess {{{
	set shortmess=a																 " use every short text trick				 
	set shortmess+=s															 " no 'search hit bottom'
	set shortmess+=W															 " don't echo '[w]'/'[written]' when writing
" }}}
" viminfo {{{
	set viminfo=h,'500															 " disable hlsearch while loading viminfo
	set viminfo+=<10000															 " remember up to 10000 lines in each register
    set viminfo+=s1000															 " remember up to 1MB in each register
    set viminfo+=/1000															 " remember last 1000 search patterns
    set viminfo+=:1000															 " remember last 1000 commands
	set viminfo^=%                                                               " Remember info about open buffers on close
" }}}
" grep program {{{	
	if executable('ag')
	  set grepprg=ag\ --nogroup\ --nocolor
	elseif executable('ack')
		set grepprg=ack\ -H\ --nocolor\ --nogroup
	elseif executable('pt')
		set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
	elseif executable('rg')
		set grepprg=rg\ --vimgrep\ --no-heading
	endif
" }}}
" set cursor shape in CLI vim {{{
" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color' || &term == 'xterm' || &term == 'screen'
    let &t_SI = "\<Esc>[5 q"
	if exists('+t_SR')
		let &t_SR = "<Esc>[4 q"
	endif
    let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
" }}}
" Return to last edit position when opening files {{{
	augroup rememberPosition 
		autocmd!
		autocmd BufReadPost *
		   \ if line("'\"") > 0 && line("'\"") <= line("$") |
		   \   exe "normal! g`\"" |
		   \ endif
	augroup END
" }}}
" autoopen quickfix window after grepping {{{
	augroup quickfixGrep
		autocmd!
		let blacklist = ['tex']
		autocmd!
		autocmd QuickFixCmdPost [^l]* if index(blacklist, &ft) < 0 | cwindow
		autocmd QuickFixCmdPost l*    if index(blacklist, &ft) < 0 | lwindow
	augroup END
" }}}
" statusline {{{
if has('statusline')

	augroup StatusLineHighlight
		autocmd!
		autocmd VimEnter,Colorscheme * call functions#User1Highlight() 
	augroup END 

	set statusline=%<										" truncation point
	set statusline+=%{fugitive#head()}						" current branch
	set statusline+=\ 										" space
	set statusline+=%{functions#formatGitgutterHunks()}		" git hunks summary

	set statusline+=%{expand('%:p:h')}						" file path

	" set filepath separator based on OS
	if has ("win32") || has ('win64')
		set statusline+=\\										" file path separator
	else
		set statusline+=/								" file path separator
	endif

	set statusline+=%1*										" switch to User1 highlight group
	set statusline+=%{expand('%:t')}						" file name
	set statusline+=%*										" reset highlight group
	set statusline+=\ 

	set statusline+=%h										" help buffer flag
	set statusline+=%m										" modified flag
	set statusline+=%r										" read only flag
	set statusline+=%w										" preview window flag

	set statusline+=%=										" separation point
	set statusline+=\ 
	set statusline+=%y									" filetype
	set statusline+=\ 										" separation point
	set statusline+=%-14.(%l:%L\ ::\ %c%V%)\ 
	"set statusline+=%p%%\ 									" percentage in file
endif
" }}}
