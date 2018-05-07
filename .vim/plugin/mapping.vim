" vim: foldmethod=marker
" vim: nolist

" hi group under cursor
noremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

nnoremap <silent> <c-n> :nohl<cr>|                             " remove highlight from last search
nnoremap <space> za|                                           " space = fold toggle
nnoremap <silent> Y y$|                                        " Y = yank to the end of line
nnoremap <silent> <F7> :setlocal spell!<CR>                    " spellcheck in current buffer
nnoremap <silent> <F8> :call functions#switchSpellLang()<CR>|  " cycle through spelling languages


" VIMRC {{{
	"nnoremap <silent> <leader>ev :e $MYVIMRC<CR>|                  " edit _vimrc file
	nnoremap <silent> <leader>ev :e ~/dotfiles/.vimrc<CR>|                  " edit _vimrc file
	nnoremap <silent> <leader>sv :call functions#LoadVIMRCs()<CR>| " reload _vimrc & _gvimrc files
	"nnoremap <silent> <leader>sv :so $MYVIMRC \| so $MYGVIMRC<CR> | " reload _vimrc & _gvimrc files
" }}}

" move between splits {{{
	nnoremap <silent> <C-h> <C-w><C-h>
	nnoremap <silent> <C-j> <C-w><C-j>
	nnoremap <silent> <C-k> <C-w><C-k>
	nnoremap <silent> <C-l> <C-w><C-l>
" }}}

" plugin specific {{{

	" ClangFormat {{{
		nnoremap <silent> <leader>l :ClangFormat<CR>|                   " use ClangFormat
	" }}}
	" fugitive {{{
		nnoremap <leader>gs :Gstatus<CR>|								" git status	
		nnoremap <leader>gps :Gpush<CR>|								" git push	
		nnoremap <leader>gpl :Gpull<CR>|								" git pull
	" }}}
	" NERDTree {{{
		nnoremap <leader>n :NERDTreeToggle<CR>|                        " toggle NERDTree
	" }}}
	" projectionist {{{
		nnoremap <F4> :A<CR>|                                          " jump between header and source files
	" }}}
	" quickr {{{
		nmap <leader>z <plug>(quickr_preview)                          " preview a file from quickfix window, close with <C-W>z
	" }}}
	" scratch {{{
		nmap <leader>sc :ScratchPreview<CR>								   " open scratch buffer
	" }}}
	" startify {{{
		nnoremap <silent> <leader>s :Startify<cr>|                     " startify
	" }}}
	" tagbar {{{
		nnoremap <F6> :TagbarToggle<CR>|                               " toggle Tagbar
	" }}}
	" UndoTree {{{
		nnoremap <silent> <F5> :UndotreeToggle<CR>|						" toggle UndoTree
	" }}}
"}}}





