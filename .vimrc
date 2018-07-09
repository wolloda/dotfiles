" vim: set foldmethod=marker nolist:
set encoding=utf-8
scriptencoding utf-8

let mapleader='\'   " set leader
let maplocalleader='\'   " set localleader

" set path & runtimepath {{{
	set path=.,,,**				" set path for :find command
	if &runtimepath !~ "$HOME/dotfiles/.vim"
		let &runtimepath .= ',$HOME/dotfiles/.vim'
	endif
" }}}
" autoinstall vim-plug
call functions#InstallVimPlug()
" source plugins {{{
	call plug#begin('~/dotfiles/.vim/bundle')
	runtime! plugins.vim                  " list of plugins
	call plug#end()
" }}}
" looks, syntax, formatting {{{
	syntax on                             " syntax highlighting
	if has ('termguicolors')
		set termguicolors				  " use gui colorscheme properties in terminal
	endif

	color autumn				          " colorscheme
	"set t_Co=256
	set t_ut=							  " use bg color to clear screen

	augroup highlighting
		autocmd!
		" highlight braces, brackets, parentheses
		autocmd VimEnter * syntax match Braces /[{}]/
		autocmd VimEnter * call matchadd('Braces', '[{}()\[\]]')

		" cursorline should not change listchars' colors
		autocmd VimEnter * call matchadd('SpecialKey', '\s\+$', -1)
		autocmd VimEnter * call matchadd('SpecialKey', '^\s\+', -1) 
		autocmd VimEnter * call matchadd('SpecialKey', '\s\+$', -1)
	augroup END

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
	set formatoptions+=n														" rational wrapping of numbered lists
	set hidden                                                                   " hides buffers instead of closing them
	set scrolloff=5                                                              " start scrolling X lines before edge of viewport
	set history=1000                                                             " remember more commands and search history
	set undolevels=1000                                                          " use many muchos levels of undo
	set visualbell                                                               " don't beep
	set tabstop=4                                                                " number of visual spaces per TAB
	set shiftwidth=4                                                             " number of spaces per '>' indent
	set softtabstop=4                                                            " number of spaces for <TAB> in insert mode
	set backspace=indent,eol,start                                               " make that backspace key work the way it should
	set clipboard^=unnamed,unnamedplus											 " use system clipboard
" }}}
" spell settings {{{
	set spelllang=en														     " english as default spelllang
	set spellfile=$HOME/dotfiles/.vim/spell/en.utf-8.add						 " path to EN dictionary
" }}}
" folds {{{
	set foldenable                                                               " enable folding
	set foldlevelstart=2                                                         " 1 nested fold opened by default
	set foldnestmax=10                                                           " 10 nested fold max
	set foldmethod=syntax                                                        " folds based on syntax
	set fillchars=vert:┃											             " delimiter of vertical splits (also removes trailing dashes in closed folds)
" }}}
" splits {{{
	set splitbelow                                                               " open new splits below the current one
	set splitright                                                               " open new splits on the right side of the current one
	set fillchars+=stl:\ ,stlnc:\                                                " disable spamming carets in statusline if both active and inactive statuslines are the same
" }}}
" wrapping & linebreak {{{
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
	  " do not set lines for certain filetypes
	  let relativeNumbers_blacklist = ['tex', 'markdown', 'help', 'tagbar', 'undotree']
	  autocmd BufEnter,FocusGained,InsertLeave * if index(relativeNumbers_blacklist, &ft) < 0 | set relativenumber
	  autocmd BufLeave,FocusLost,InsertEnter   * if index(relativeNumbers_blacklist, &ft) < 0 | set norelativenumber
	augroup END
" }}}
" storing swp, tmp & undo files {{{
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/swap")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/backup")
	call functions#CreateDir("$HOME/dotfiles/.vim/tmp/undo")

	set undofile
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
	if has("nvim")
		set inccommand=nosplit													 " live substitution
	endif
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
	set wildignore+=*.aux,*.toc,*.fls,*.fdb_latexmk,*.synctex.gz " LaTeX intermediate files
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
	  set grepprg=ag\ --nogroup\ --nocolor\ --hidden
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
	if &term == 'xterm-256color' || &term == 'screen-256color' || &term == 'xterm' || &term == 'screen' || &term == 'xterm+256color'
		let &t_SI = "\<Esc>[5 q"
		if exists('+t_SR')
			let &t_SR = "\<Esc>[4 q"
		endif
		let &t_EI = "\<Esc>[1 q"
	endif

	" needs separate settings to work within TMUX
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
		" do not do so for latex files (colisions with VimTex plugin)
		let grepBlacklist = ['tex']
		autocmd QuickFixCmdPost [^l]* if index(grepBlacklist, &ft) < 0 | cwindow
		autocmd QuickFixCmdPost l*    if index(grepBlacklist, &ft) < 0 | lwindow
	augroup END
" }}}

