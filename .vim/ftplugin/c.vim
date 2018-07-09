" vim: set foldmethod=marker nolist:

if executable("clang-format")
	setlocal equalprg=clang-format\ -style=file\ -assume-filename=%
endif
