" vim: set foldmethod=marker nolist:

let cpp_fold=1                                                               " folding

if executable("clang-format")
	setlocal equalprg=clang-format\ -style=file\ -assume-filename=%
endif

if has('win32') || has('win64')
	setlocal keywordprg=:!start\ https://devdocs.io\?q=cpp
elseif has('macunix') || has('mac')
    setlocal keywordprg=open\ https://devdocs.io/\?q=cpp\
else
    setlocal keywordprg=xdg-open\ https://devdocs.io/\?q=cpp\
endif

let &l:makeprg='make --directory=build --no-print-directory'

" ClangFormat {{{
	nnoremap <buffer> <silent> <leader>l :ClangFormat<CR>|                   " use ClangFormat
" }}}
