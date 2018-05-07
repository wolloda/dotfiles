" vim: foldmethod=marker nolist:

" autopairs {{{
	let g:AutoPairsMoveCharacter = ""				" disable interfering binding
" }}}
" ClangFormat {{{
	let g:clang_format#detect_style_file=1			" codestyle from file
	let g:clang_format#enable_fallback_style=0		" do nothing w/o .clang-format
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
" NERDTree {{{
	"autocmd vimenter * NERDTree		" autoopen NERDTree
	"autocmd VimEnter * wincmd p		" don't focus it
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	" close VIM if NERDTree is the last buffer open

	let NERDTreeHijackNetrw=1
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeDirArrowExpandable = '▸'
	let g:NERDTreeDirArrowCollapsible = '▾'
	let g:NERDTreeShowHidden = 1
	let NERDTreeIgnore=['\.swp$']	" ignore .swp files
	let NERDTreeChDirMode=2
" }}}
" netrw {{{
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
" }}}
" Polyglot {{{
let g:polyglot_disabled=['latex']
" }}}
" Prosession {{{
	let g:prosession_dir = $HOME.'/dotfiles/.vim/tmp/session/'
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
				\ '~/dotfiles/.vim/plugin_settings.vim',
				\ '~/dotfiles/.vim/plugin/mapping.vim',
				\ '~/dotfiles/.vim/autoload/functions.vim',
				\ '~/colorscheme/vim-wollf/colors/wollf.vim',
				\ '~/dotfiles/.vim/bundle/vim-wollf/colors/wollf.vim']

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
" taboo {{{
	let g:taboo_tab_format = " %f (%W) %m"
	let g:taboo_modified_tab_flag = "[+]"
" }}}
" tagbar {{{
	let g:tagbar_ctags_bin = 'C:/Users/kanav/dotfiles/ctags58/ctags.exe'
	let g:tagbar_sort = 0	" do not sort tags by alphabet
	let g:tagbar_compact = 1 " omit not needed blank lines and help info
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
" Vim-Rooter {{{
	"let g:rooter_change_directory_for_non_project_files = 'current'
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
	if !has("patch-7.4-1578")
		let g:loaded_youcompleteme = 0
	endif

	let g:haskellmode_completion_ghc = 0 " Disable haskell-vim omnifunc

	let g:ycm_global_ycm_extra_conf = 'C:\Users\kanav\dotfiles\.vim\bundle\YouCompleteMe\third_party\ycmd\cpp\ycm\.ycm_extra_conf.py'
	let g:ycm_python_binary_path = 'C:\Program Files\Python36\python.exe'
	let g:ycm_autoclose_preview_window_after_completion=1
	let g:ycm_semantic_triggers = {'haskell' : ['.']}
	let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme		" enable latex autocompletion (vimtex)
	let g:ycm_confirm_extra_conf = 0								" no need to confirm loading of .ycm_extra_conf.py
" }}}
