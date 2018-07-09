" vim: set foldmethod=marker nolist:

setlocal nonumber
setlocal norelativenumber
setlocal nolist
setlocal textwidth=100

if has('win32') || has('win64')
	"if filereadable(expand('%<:t').".pdf")
	nnoremap <buffer> <leader>pp :!start %<.pdf<CR>
	nnoremap <buffer> <leader>p :!start cmd /c start chrome %<CR>
	if executable("pandoc")
		nnoremap <buffer> <leader>pm :!start pandoc % -o %<.pdf<CR>
	endif
elseif has('macunix') || has('mac')
	nnoremap <buffer> <leader>pp :!open %<.pdf<CR>
	nnoremap <buffer> <leader>p :!open -a "Google Chrome" %<CR>
	if executable("pandoc")
		nnoremap <buffer> <leader>pm :!pandoc % -o %<.pdf &<CR>
	endif
elseif has('unix')
	nnoremap <buffer> <leader>pp :!xdg-open %<.pdf &<CR>
	nnoremap <buffer> <leader>p :!google-chrome % &<CR>
	" nnoremap <buffer> <leader>p :exe '!nohup sensible-browser % &'<CR>:redraw!<CR>
	if executable("pandoc")
		nnoremap <buffer> <leader>pm :!pandoc % -o %<.pdf &<CR>
	endif
endif

nnoremap <buffer> <leader>h :<C-U>InsertMarkdownHeading(v:count)<CR>


