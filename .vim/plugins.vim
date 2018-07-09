" vim: nolist foldmethod=marker

" plugin list {{{
	" autocompletion, snippets {{{
		Plug 'Valloric/YouCompleteMe', { 'do': './install.py\ --clang-completer' }		" autocompletion
		Plug 'SirVer/ultisnips'           " snippets engine
		Plug 'honza/vim-snippets'         " collection of snippets
	" }}}
	" colorschemes {{{
		Plug 'lifepillar/vim-gruvbox8'
		Plug 'NLKNguyen/papercolor-theme'
		Plug 'trevordmiller/nova-vim'
		Plug 'ajmwagar/vim-deus'
		Plug 'romainl/flattened'
		Plug 'https://gitlab.fi.muni.cz/xkana1/vim-autumn.git'
	" }}}
	" opening files, managing buffers and tabs {{{
		Plug 'tpope/vim-projectionist'      " switch between source and header files

		" use ctrlp only when fzf is not available
		if !executable('fzf')
			Plug 'kien/ctrlp.vim'			" fuzzy finder
		endif

		if executable('fzf')
			Plug 'junegunn/fzf'				" vim wrapper for FZF
			Plug 'junegunn/fzf.vim'			" vim wrapper for FZF
		endif

		" quickfix window {{{
			Plug 'yssl/QFEnter'				" quickfix window file opening
			Plug 'ronakg/quickr-preview.vim' " preview files from quickfix window
		" }}}
		Plug 'tpope/vim-vinegar'			" netrw extension
		Plug 'wesQ3/vim-windowswap'			" swap splits (default with <leader>ww)
	" }}}
	" GIT {{{
		" TODO add diff.exe to PATH
		Plug 'tpope/vim-fugitive'             " use GIT from VIM

		Plug 'airblade/vim-gitgutter'		  " mark lines that diff from git repo
		Plug 'junegunn/gv.vim'				  " git commit browser
		Plug 'christoomey/vim-conflicted'	  " easier conflicts resolving
	" }}}
	" motions & operators {{{
		Plug 'unblevable/quick-scope'         " highlighting after using f, F, t, T
		Plug 'wellle/targets.vim'			  " more motions (such as di, ...)
		Plug 'andymass/vim-matchup'			  " extend % operator
		Plug 'michaeljsmith/vim-indent-object' " indentwise operations
	" }}}
	" syntax, language specific {{{
		" TODO use my own fork of octol/cpp-highlighting to highlight structs too
		Plug 'sheerun/vim-polyglot'           " language pack
		" CSS {{{
			Plug 'ap/vim-css-color', { 'for': 'css' }		" display colors
		" }}}
		" Haskell {{{
			if executable("ghci")
				" TODO install ghc-mod using 'cabal install ghc-mod'
				Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' } " autocompletion
				Plug 'eagletmt/neco-ghc', { 'for': 'haskell' } " type of sub-expressions, errors,...
			endif
		" }}}
		" HTML {{{
			Plug 'rstacruz/sparkup', {'rtp': 'vim/', 'for': ['html', 'javascript', 'jsx', 'php']}   " like emmet
		" }}}
		" LaTeX {{{
			if executable('latex')
				Plug 'lervag/vimtex', { 'for': 'tex' }          " LaTeX
			endif
		" }}}
		" Markdown {{{
			Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " Markdown features
			if exists(":Tagbar")
				Plug 'jszakmeister/markdown2ctags', { 'for': 'markdown' } " markdown extension for tagbar
			endif
		" }}}
		" Prolog {{{
			if executable("swipl")
				Plug 'mxw/vim-prolog', { 'for': 'prolog' }		 " prolog syntax higlight
			endif
		" }}}
		" R {{{
			if executable("r") || executable("R")
				Plug 'jalvesaq/Nvim-R', { 'for': 'r' } " R main plugin
				Plug 'gaalcaras/ncm-R', { 'for': 'r' } " VIM autocompletion
			endif
		" }}}
		Plug 'PotatoesMaster/i3-vim-syntax'   " .i3 syntax
		Plug 'tmux-plugins/vim-tmux'		  " .tmux.conf syntax
	"}}}
	" text editing, commenting, substitution {{{
		" writing prose {{{
			Plug 'dbmrq/vim-ditto'			 " check word overuse
			Plug 'junegunn/goyo.vim'			 " show only current buffer
			Plug 'junegunn/limelight.vim'		 " highlight only a current paragraph
			Plug 'reedes/vim-pencil'			 " line breaking
		" }}}
		" formatting {{{
			Plug 'godlygeek/tabular'           " unify indentation based on a character
			Plug 'machakann/vim-sandwich'      " vim-surround alternative
		" }}}
		Plug 'jiangmiao/auto-pairs'            " insert parentheses, brackets,... in pairs
		Plug 'tpope/vim-commentary'			 " commenting plugin
	"}}}
	" Utilities {{{
		" tmux {{{
			if executable('tmux')
				" there is no point in installing tmux plugins on Windows
				Plug 'tpope/vim-tbone'			
				Plug 'benmills/vimux'		      " interact with tmux from within vim
				Plug 'wellle/tmux-complete.vim' " autocompletion from other tmux panes and sessions
			endif
		" }}}
		if has("nvim") || has("patch-8.0-1394") " there is a need to configure plugin in older versions
			Plug 'machakann/vim-highlightedyank' " highlight yanked region
		endif
		if !has("nvim")
			" this feature is built-in in nvim
			Plug 'markonm/traces.vim'              " live substitution
		endif
		Plug 'lilydjwg/colorizer'
		Plug 'henrik/vim-indexed-search'       " show number of matches on search
		Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}                 " undo tree
		Plug 'tpope/vim-endwise'               " automatically end blocks (endfunction, endif,...)
		Plug 'tpope/vim-eunuch'                " UNIX-y commands in vim
		Plug 'tpope/vim-dispatch'              " async commands execution
		Plug 'junegunn/vim-peekaboo'           " show contents of registers on pressing \" and @
		Plug 'tpope/vim-repeat'                " enables . command on plugins too
		Plug 'tpope/vim-unimpaired'            " handy pair mappings
		Plug 'mhinz/vim-startify'              " start screen
		Plug 'nelstrom/vim-visual-star-search' " use # and * from visual mode

		" TODO download ctags
		if executable("ctags")
			Plug 'majutsushi/tagbar'               " list of functions, classes, variables used
		endif
	" }}}
"}}}
" plugin settings {{{
	" autopairs {{{
		let g:AutoPairsMoveCharacter = ""				" disable interfering binding
	" }}}
	" CPP enhanced highlighting {{{
		let g:cpp_class_scope_highlight           = 1 " highlight class scope
		let g:cpp_member_variable_highlight       = 1 " highlight member variables
		let g:cpp_class_decl_highlight            = 1 " highlight class names in declarations
		let g:cpp_concepts_highlight              = 1 " highlight cpp concepts
		"let g:cpp_experimental_template_highlight = 1 " highlight template functions
	" }}}
	" CTRL-P {{{
		let g:ctrlp_extensions = ['line', 'dir', 'mixed']

		if executable('ag')
			" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
			let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
		endif

		let g:ctrlp_use_caching = 0 " ag is too fast to need caching
	" }}}
	" FZF {{{
		if has('win32') || has('win64')
			set rtp+=C:\ProgramData\chocolatey\bin
			let g:fzf_launcher = 'cmd'
		endif

		let g:fzf_colors =
		\ { 'fg':      ['fg', 'Normal'],
		  \ 'bg':      ['bg', 'Normal'],
		  \ 'hl':      ['fg', 'Conceal'],
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
	" }}}
	" GitGutter {{{
		let g:gitgutter_sign_added = '•'
		let g:gitgutter_sign_modified = '•'
		let g:gitgutter_sign_removed = '•'
	" }}}
	" markdown2ctags {{{
		" Add support for markdown files in tagbar.
		let g:tagbar_type_markdown = {
			\ 'ctagstype': 'markdown',
			\ 'ctagsbin' : 'C:/Users/kanav/dotfiles/.vim/bundle/markdown2ctags/markdown2ctags.py',
			\ 'ctagsargs' : '-f - --sort=yes',
			\ 'kinds' : [
				\ 's:sections',
				\ 'i:images'
			\ ],
			\ 'sro' : '|',
			\ 'kind2scope' : {
				\ 's' : 'section',
			\ },
			\ 'sort': 0,
		\ }

		let g:tagbar_type_mkd = {
			\ 'ctagstype': 'mkd',
			\ 'ctagsbin' : 'C:/Users/kanav/dotfiles/.vim/bundle/markdown2ctags/markdown2ctags.py',
			\ 'ctagsargs' : '-f - --sort=yes',
			\ 'kinds' : [
				\ 's:sections',
				\ 'i:images'
			\ ],
			\ 'sro' : '|',
			\ 'kind2scope' : {
				\ 's' : 'section',
			\ },
			\ 'sort': 0,
		\ }
	" }}}
	" matchup {{{
		" installing it anyway, because of different VIM versions on school
		" computers
		if !has("patch-7.4-2180")
			let g:matchup_enabled = 0
		endif
	" }}}
	" netrw {{{
		let g:netrw_banner = 0
		let g:netrw_liststyle = 3
	" }}}
	" Polyglot {{{
		let g:polyglot_disabled=['latex']
	" }}}
	" Quick-Scope {{{
		let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']	" highlight only after using certain keys
	" }}}
	" quickr preview {{{
		let g:quickr_preview_keymaps = 0				" turn of default mapping
	" }}}
	" Startify {{{
		let g:startify_bookmarks = 
					\ ['~/dotfiles/.vimrc',
					\ '~/dotfiles/.gvimrc',
					\ '~/dotfiles/.vim/plugins.vim',
					\ '~/dotfiles/.vim/plugins_not_in_use.vim',
					\ '~/dotfiles/.vim/plugin/mapping.vim',
					\ '~/dotfiles/.vim/ftplugin/',
					\ '~/dotfiles/.vim/autoload/',
					\ '~/dotfiles/.vim/plugin/',
					\ '~/dotfiles/.vim/bundle/vim-autumn/colors/autumn.vim']

		let g:startify_list_order = [
				\ ['   bookmarks:'],
				\ 'bookmarks',
				\ ['   most recently used files:'],
				\ 'files',
				\ ['   most recently used files in the current directory:'],
				\ 'dir',
				\ ['   sessions:'],
				\ 'sessions',
				\ ['   commands:'],
				\ 'commands',
				\ ]
	"	}}}
	" tagbar {{{
		let g:tagbar_ctags_bin = '~/dotfiles/ctags58/ctags.exe'
		let g:tagbar_sort = 0	" do not sort tags by alphabet
		let g:tagbar_compact = 1 " omit not needed blank lines and help info
	" }}}
	" tmux-complete {{{
		let g:tmuxcomplete#trigger = 'omnifunc'
	" }}}
	" UltiSnips {{{
		" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
		let g:UltiSnipsExpandTrigger="<c-q>"
		let g:UltiSnipsJumpForwardTrigger="<c-b>"
		let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	" }}}
	" VIM markdown {{{
		let g:vim_markdown_math = 1			" LaTeX inside markdown
	" }}}
	" vimtex {{{
		let g:vimtex_compiler_latexmk = {
			\ 'backend' : 'jobs',
			\ 'background' : 1,
			\ 'build_dir' : '',
			\ 'callback' : 0,
			\ 'continuous' : 0,
			\ 'executable' : 'latexmk',
			\ 'options' : [
			\   '-pdf',
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\}

		let g:vimtex_view_automatic      = 1
		let g:vimtex_view_general_viewer = 'mupdf'
		let g:view_method                = 'mupdf'
	" }}}
	" YouCompleteMe {{{
		" turn YCM off for unsupported versions
		" due to different versions of VIM on school computers
		if !has("patch-7.4-1578")
			let g:loaded_youcompleteme = 0
		endif

		let g:haskellmode_completion_ghc = 0 " Disable haskell-vim omnifunc

		let g:ycm_global_ycm_extra_conf = '~/dotfiles/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
		let g:ycm_python_binary_path = '/usr/bin/python3'
		let g:ycm_autoclose_preview_window_after_completion=1
		let g:ycm_semantic_triggers = {'haskell' : ['.']}

		if exists("g:vimtex_compiler_callback_hooks")
			let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme		" enable latex autocompletion (vimtex)
		endif

		let g:ycm_confirm_extra_conf = 0								" no need to confirm loading of .ycm_extra_conf.py
	" }}}
" }}}
