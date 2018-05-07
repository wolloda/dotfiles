" vim: foldmethod=marker nolist:

" this is a list of plugins (and their settings) I either used to use & stop,
" or am about to try them

" currently not in use {{{
	" colorschemes {{{
		"Plugin 'godlygeek/csapprox.git'									" approximate gVim themes for 256 (88) color terminal

		"Plugin 'junegunn/seoul256.vim'
		"Plugin 'altercation/vim-colors-solarized.git'						" using romainl's flattened
		"Plugin 'rakr/vim-two-firewatch.git'
		"Plugin 'challenger-deep-theme/vim.git'
		"Plugin 'flazz/vim-colorschemes'									" mega colorscheme pack
		"Plugin 'nightsense/carbonized'
		"Plugin 'trevordmiller/nova-vim.git'
		"Plugin 'drewtempelmeyer/palenight.vim'
		"Plugin 'mkarmona/materialbox'
		"Plugin 'colepeters/spacemacs-theme.vim'
		"Plugin 'gosukiwi/vim-atom-dark'
		"Plugin 'rhysd/vim-color-spring-night'
		"Plugin 'altercation/vim-colors-solarized'
		"Plugin 'tomasr/molokai'
		"Plugin 'nightsense/vim-crunchbang'
		"Plugin 'skielbasa/vim-material-monokai'
		"Plugin 'jdkanani/vim-material-theme'
		"Plugin 'arcticicestudio/nord-vim'
		"Plugin 'rakr/vim-one.git'
		"Plugin 'hzchirs/vim-material'
		"Plugin 'liuchengxu/space-vim-dark'
	" }}}
	" language specific {{{
		 "Haskell {{{
			" TODO install ghc-mod using 'cabal install ghc-mod'
			"Plugin 'eagletmt/ghcmod-vim.git'        " autocompletion
			"Plugin 'eagletmt/neco-ghc.git'          " type of sub-expressions, errors,...
		" }}}
		" Pandoc {{{
			"Plugin 'vim-pandoc/vim-pandoc.git'        " pandoc
			"Plugin 'vim-pandoc/vim-pandoc-syntax.git' " syntax for pandoc
			"Plugin 'vim-pandoc/vim-pandoc-after.git'  " integration with other plugins (ultisnips,...)
		" }}}
		" prolog {{{
			"Plugin 'mxw/vim-prolog.git'             " prolog syntax higlight
		" }}}
		" LaTex {{{
			"Plugin 'xuhdev/vim-latex-live-preview'	  " LaTeX live preview
			"Plugin 'vim-latex/vim-latex.git'
		" }}}
		" HTML {{{
			"Plugin 'mattn/emmet-vim'				 " emmet (html abbreviations)
		" }}}
	" }}}
	" nerdcommenter lightweight alternatives {{{
		"Plugin 'tpope/vim-commentary.git'	
		"Plugin 'tomtom/tcomment_vim.git'
	" }}}
	" status bar {{{
		"Plugin 'bling/vim-airline'              " status bar
		"Plugin 'vim-airline/vim-airline-themes' " airline themes
	" }}}
	"Plugin 'airblade/vim-rooter.git'        " change project root dir
	"Plugin 'machakann/vim-sandwich.git'     " vim-surround alternative
	"Plugin 'Yggdroot/indentLine'            " show indention level
	"Plugin 'vim-syntastic/syntastic.git'    " syntax checker / linter
	"Plugin 'chrisbra/NrrwRgn.git'			 " narrow region
	"Plugin 'terryma/vim-expand-region.git'  " expand region
	"Plugin 'AndrewRadev/splitjoin.vim.git'  " joining / splitting lines
	"Plugin 'tommcdo/vim-lion.git'           " formatting
	"Plugin 'osyo-manga/vim-over'            " live substitution
	"Plugin 'vim-scripts/mru.vim.git'        " recently used files
	"Plugin 'tpope/vim-abolish.git'		     " substitute keeping capitals, change coercion
" }}}

" airline {{{
	"function! AirlineInit()
		"let g:airline_section_y = ''
		" filename should use different colour
		"let g:airline_section_c = '%<%{expand("%:~:h")}\%#__accent_red#%{expand("%:~:t")}%#__restore__#%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#' " default section_c with filename colored red
		"let g:airline_section_z = '%l:%L :: %c'				" disable percentage (lines in file)
	"endfunction
	"autocmd User AirlineAfterInit call AirlineInit()

	"let g:airline_powerline_fonts = 1				" enable powerline fonts (arrows,...)
	"let g:airline_theme = 'minimalist'				" colorscheme
"	let g:airline#extensions#tabline#enabled = 1	" show buffers on top of the screen
" }}}

" IndentLines {{{
	"let g:indentLine_enabled = 1 
	"let g:indentLine_leadingSpaceChar = '•'
	"let g:indentLine_leadingSpaceEnabled = 1

	"Let indentLine use current conceal options
	"let g:indentLine_setConceal = 0
	"let g:indentLine_setColors = 0
" }}}
