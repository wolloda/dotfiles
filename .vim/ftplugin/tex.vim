" vim: set foldmethod=marker nolist:

setlocal nonumber
setlocal norelativenumber
setlocal nolist
setlocal foldlevelstart=10
setlocal foldlevel=10

if filereadable(expand('%<:t').".pdf")
	" \p to open generated pdf
	if has('win32') || has('win64')
		nnoremap <buffer> <leader>p :!start %<.pdf<CR>
	elseif has('mac') || has('macunix') 
		nnoremap <buffer> <leader>p :!open %<.pdf &<CR>
	elseif has('unix')
		nnoremap <buffer> <leader>p :!xdg-open %<.pdf &<CR>
	endif
endif

let g:tex_fold_enabled=1				" enable folding
