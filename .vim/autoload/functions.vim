" vim: nolist:

" source VIMRC & GVIMRC (if present)
function! functions#LoadVIMRCs()
	source $MYVIMRC
	if has('gui_running') && !empty($MYGVIMRC)
		source $MYGVIMRC
	endif
endfunction

" create dir with given name
function! functions#CreateDir(path)
	let path_name = expand(a:path)
	if !isdirectory(path_name)
		call mkdir(path_name)
	endif
endfunction

" cycle between spelling languages
function! functions#switchSpellLang() abort
	let l:languages = ['en', 'cs']
    let i = index(l:languages, &spelllang)
    let j = (i + 1) % len(l:languages)
    let &spelllang = l:languages[j]
	let &spellfile = $HOME . '/dotfiles/.vim/spell/' . l:languages[j] . '.utf-8.add'
endfunction

" create markdown headings
function! functions#markdownHeading(count)
	let headerString = repeat("#", a:count)
	execute 'normal I' . headerString . " "
	startinsert! " `A`
endfunction

command! -nargs=1 InsertMarkdownHeading call functions#markdownHeading(<args>)

" helper function for vim-plug (load plugins only if a condition is met)
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" remove trailing whitespace
function! functions#TrimWhitespace() abort
	let l:save = winsaveview()
	execute "keepjumps %s/\\s\\+$//ge"
	call winrestview(l:save)
endfunction

function! functions#InstallVimPlug() abort
		let l:path = expand("~")
		let l:path .= '/dotfiles/.vim/autoload/plug.vim'
		if empty(glob(l:path)) && executable("curl")
			execute 'silent !curl -fLo ' . l:path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif
endfunction
