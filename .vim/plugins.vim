" vim: nolist foldmethod=marker

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" autocompletion, snippets {{{
	" TODO compile YouCompleteMe
	Plugin 'Valloric/YouCompleteMe.git' " autocompletion
	Plugin 'SirVer/ultisnips'           " snippets engine
	Plugin 'honza/vim-snippets'         " collection of snippets
" }}}
" autosave sessions {{{
	Plugin 'tpope/vim-obsession.git'
	Plugin 'dhruvasagar/vim-prosession.git'
" }}}
" colorschemes {{{
	Plugin 'ajmwagar/vim-deus.git'
	Plugin 'romainl/flattened.git'
	Plugin 'https://gitlab.fi.muni.cz/xkana1/vim-wollf.git'
" }}}
" opening files, managing buffers and tabs {{{
	Plugin 'tpope/vim-projectionist.git'    " switch between source and header files
	Plugin 'kien/ctrlp.vim.git'        " fuzzy finder
	Plugin 'junegunn/fzf'              " vim wrapper for FZF
	Plugin 'junegunn/fzf.vim.git'      " vim wrapper for FZF
	Plugin 'yssl/QFEnter.git'          " quickfix window file opening
	Plugin 'ronakg/quickr-preview.vim' " preview files from quickfix window
	Plugin 'scrooloose/nerdtree.git'   " file tree
	Plugin 'tpope/vim-vinegar'         " netrw extension
	Plugin 'gcmt/taboo.vim.git'             " custom tab names
	Plugin 'wesQ3/vim-windowswap'           " swap splits (default with <leader>ww)
" }}}
" GIT {{{
	" TODO add diff.exe to PATH
	Plugin 'tpope/vim-fugitive'             " use GIT from VIM
	Plugin 'airblade/vim-gitgutter.git'     " mark lines that diff from git repo
	Plugin 'xuyuanp/nerdtree-git-plugin'    " see GIT changed files in NERDTREE
	Plugin 'junegunn/gv.vim.git'            " git commit browser
	Plugin 'christoomey/vim-conflicted'		" easier conflicts resolving
" }}}
" motions {{{
	Plugin 'easymotion/vim-easymotion.git' " quick moving with <leader><leader>{motion}
	Plugin 'unblevable/quick-scope'        " highlighting after using f, F, t, T
	Plugin 'wellle/targets.vim.git'        " more motions
" }}}
" syntax, languages {{{
	" TODO use my own fork of octol/cpp-highlighting to hl structs too
	Plugin 'sheerun/vim-polyglot'             " language pack
	" C-family {{{
		" TODO download clang format (LLVM)
		Plugin 'rhysd/vim-clang-format.git'     " Clang-Format
		Plugin 'vhdirk/vim-cmake.git'			" use Cmake from within VIM
	" }}}
	" LaTeX {{{
		Plugin 'lervag/vimtex'                    " LaTeX
	" }}}
	" Markdown {{{
		Plugin 'plasticboy/vim-markdown'          " Markdown features
		Plugin 'jszakmeister/markdown2ctags.git'  " markdown extension for tagbar
	" }}}
	Plugin 'PotatoesMaster/i3-vim-syntax.git'  " .i3 syntax
"}}}
" text editing, commenting, substitution {{{
	" writing prose {{{
		Plugin 'dbmrq/vim-ditto.git'		" check word overuse
		Plugin 'junegunn/goyo.vim'          " show only current buffer
		Plugin 'junegunn/limelight.vim.git' " highlight only a current paragraph
		Plugin 'reedes/vim-pencil.git'      " line breaking
	" }}}
	" formatting {{{
		Plugin 'godlygeek/tabular.git'          " unify indentation based on a character
		Plugin 'tpope/vim-surround.git'         " manipulate surrounding characters
	" }}}
	Plugin 'mbbill/undotree.git'            " undo tree
	Plugin 'henrik/vim-indexed-search.git'  " show number of matches on search
	Plugin 'jiangmiao/auto-pairs'           " insert parentheses, brackets,... in pairs
	Plugin 'scrooloose/nerdcommenter'       " commenting plugin
	Plugin 'mtth/scratch.vim'				" create scratch buffer
	Plugin 'markonm/traces.vim.git'			" live substitution
"}}}
" Utilities {{{
	Plugin 'tpope/vim-dispatch'				" async compiling
	Plugin 'junegunn/vim-peekaboo'			" show contents of registers on pressing \" and @
	Plugin 'tpope/vim-repeat.git'			" enables . command on plugins too
	Plugin 'tpope/vim-unimpaired.git'       " handy pair mappings
	Plugin 'mhinz/vim-startify'             " start screen

	" TODO download ctags
	Plugin 'majutsushi/tagbar'              " list of functions, classes, variables used

	" TODO compile
	Plugin 'Shougo/vimproc.vim'				" needed by other plugins
" }}}

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

