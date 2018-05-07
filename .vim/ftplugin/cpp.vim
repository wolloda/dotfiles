setlocal equalprg=clang-format\ -style=file\ -assume-filename=%
let &l:makeprg='make -C build'
