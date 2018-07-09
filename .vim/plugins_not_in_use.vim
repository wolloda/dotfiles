" vim: foldmethod=marker nolist:

" this is a list of plugins (and their settings) I either used to use & stopped,
" or those I am yet about to try

" yet to try {{{
	Plug 'mhinz/vim-signify'             " git-gutter alternative
	Plug 'editorconfig/editorconfig-vim' " load formatting configuration
	Plug 'kana/vim-operator-user'        " define your own operators
	Plug 'kana/vim-textobj-user'         " define your own text objects
	Plug 'francoiscabrol/ranger.vim'     " ranger in vim
	Plug 'vim-syntastic/syntastic'       " syntax checker / linter
	Plug 'w0rp/ale'                      " syntax checker / linter
	Plug 'ludovicchabant/vim-gutentags'
" }}}

" currently not in use {{{
	" autosave sessions {{{
		Plug 'tpope/vim-obsession'
		Plug 'dhruvasagar/vim-prosession'
	" }}}
	" colorschemes {{{
		Plug 'godlygeek/csapprox'									" approximate gVim themes for 256 (88) color terminal

		Plug 'junegunn/seoul256.vim'
		Plug 'altercation/vim-colors-solarized'						" using romainl's flattened
		Plug 'rakr/vim-two-firewatch'
		Plug 'challenger-deep-theme/vim'
		Plug 'flazz/vim-colorschemes'									" mega colorscheme pack
		Plug 'nightsense/carbonized'
		Plug 'drewtempelmeyer/palenight.vim'
		Plug 'mkarmona/materialbox'
		Plug 'colepeters/spacemacs-theme.vim'
		Plug 'gosukiwi/vim-atom-dark'
		Plug 'rhysd/vim-color-spring-night'
		Plug 'altercation/vim-colors-solarized'
		Plug 'tomasr/molokai'
		Plug 'nightsense/vim-crunchbang'
		Plug 'skielbasa/vim-material-monokai'
		Plug 'jdkanani/vim-material-theme'
		Plug 'arcticicestudio/nord-vim'
		Plug 'rakr/vim-one'
		Plug 'hzchirs/vim-material'
		Plug 'liuchengxu/space-vim-dark'
	" }}}
	" language specific {{{
		" C-family {{{
			Plug 'octol/vim-cpp-enhanced-highlight'						" syntax
			if executable('clang-format')
				" set and use equalprg / formatprg instead
				Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }    " Clang-Format
			endif
			if executable('cmake')
				" decided to shell out instead
				Plug 'vhdirk/vim-cmake', { 'for': ['c', 'cpp'] }			" use Cmake from within VIM
			endif
		" }}}
		" HTML {{{
			Plug 'mattn/emmet-vim', { 'for': 'html' }				 " emmet (html abbreviations)
		" }}}
		" LaTex {{{
			if executable('latex')
				Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }	  " LaTeX live preview
				Plug 'vim-latex/vim-latex', { 'for': 'tex' }
			endif
		" }}}
		" Pandoc {{{
			if executable('pandoc')
				Plug 'vim-pandoc/vim-pandoc'        " pandoc
				Plug 'vim-pandoc/vim-pandoc-syntax' " syntax for pandoc
				Plug 'vim-pandoc/vim-rmarkdown'
				Plug 'vim-pandoc/vim-pandoc-after'  " integration with other plugins (ultisnips,...)
			endif
		" }}}
	" }}}
	" commenting plugins {{{
		Plug 'tomtom/tcomment_vim'
		Plug 'scrooloose/nerdcommenter'
	" }}}
	" GIT {{{
		Plug 'tpope/vim-rhubarb'			  " :Gbrowse fugitive extension for github
		Plug 'shumphrey/fugitive-gitlab.vim'  " :Gbrowse fugitive extension for gitlab
		Plug 'tommcdo/vim-fubitive'			  " :Gbrowse fugitive extension for bitbucket
		Plug 'xuyuanp/nerdtree-git-plugin'    " see GIT changed files in NERDTREE
	" }}}
	Plug 'gcmt/taboo.vim'				" custom tab names
	" TODO compile
	" recommended for clang-format in Windows
	Plug 'Shougo/vimproc.vim'				 " needed by other plugins

	Plug 'airblade/vim-rooter'        " change project root dir

	Plug 'chrisbra/NrrwRgn'			 " narrow region
	Plug 'terryma/vim-expand-region'  " expand region

	" formatting {{{
		Plug 'AndrewRadev/splitjoin.vim'  " joining / splitting lines
		Plug 'tommcdo/vim-lion'           " formatting
		Plug 'junegunn/vim-easy-align'	" tabular alternative
	" }}}

	Plug 'easymotion/vim-easymotion'		" quick moving with <leader><leader>{motion}
	Plug 'tpope/vim-abolish'		     " substitute keeping capitals, change coercion

	" netrw should be sufficient
	Plug 'scrooloose/nerdtree'			" file tree

	" new buffer will suffice
	Plug 'mtth/scratch.vim'                " scratch buffer

	" replaced with proper keyword prg for cpp files
	Plug 'romainl/vim-devdocs'			   " search devdocs.io

	" disabled due to troubles it caused when opening cpp files
	Plug 'tpope/vim-apathy'

	" replaced with markonm/traces
	Plug 'osyo-manga/vim-over'            " live substitution

	" provided by startify
	Plug 'vim-scripts/mru.vim'        " recently used files

	" replaced with vim-sandwich
	Plug 'tpope/vim-surround'          " manipulate surrounding characters
	
	" replaced with built-in listchars
	Plug 'Yggdroot/indentLine'            " show indention level
" }}}

" settings {{{
	" ClangFormat {{{
		let g:clang_format#detect_style_file=1			" codestyle from file
		let g:clang_format#enable_fallback_style=0		" do nothing w/o .clang-format file
	" }}}
	" GIT related {{{
		let g:fugitive_gitlab_domains = ['https://gitlab.fi.muni.cz']	" use school gitlab
	" }}}
	" IndentLine {{{
		let g:indentLine_enabled = 1 
		let g:indentLine_leadingSpaceChar = '•'
		let g:indentLine_leadingSpaceEnabled = 1

		" let indentLine use current conceal options
		let g:indentLine_setConceal = 0
		let g:indentLine_setColors = 0
	" }}}
	" NERDTree {{{
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	" close VIM if NERDTree is the last buffer open

		let NERDTreeHijackNetrw=1
		let g:NERDTreeMinimalUI = 1
		let g:NERDTreeDirArrowExpandable = '▸'
		let g:NERDTreeDirArrowCollapsible = '▾'
		let g:NERDTreeShowHidden = 1
		let NERDTreeIgnore=['\.swp$']	" ignore .swp files
		let NERDTreeChDirMode=2
	" }}}
	" Prosession {{{
		" let g:prosession_dir = $HOME.'/dotfiles/.vim/tmp/session/'
	" }}}
	" taboo {{{
		let g:taboo_tab_format = " %f (%W) %m"
		let g:taboo_modified_tab_flag = "[+]"
	" }}}
	" Vim-Rooter {{{
		let g:rooter_change_directory_for_non_project_files = 'current'
	" }}}
" }}}
