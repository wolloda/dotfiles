function! functions#LoadVIMRCs()
	source $MYVIMRC
	if has('gui_running') && !empty($MYGVIMRC)
		source $MYGVIMRC
	endif
endfunction

function! functions#CreateDir(path)
	let path_name = expand(a:path)
	if !isdirectory(path_name)
		call mkdir(path_name)
	endif
endfunction

function! functions#switchSpellLang() abort
	let l:languages = ['en', 'cs']

    let i = index(l:languages, &spelllang)
    let j = (i + 1) % len(l:languages)
    let &spelllang = l:languages[j]
	let &spellfile = $HOME . '/dotfiles/.vim/spell/' . l:languages[j] . '.utf-8.add'
endfunction

function! functions#User1Highlight() abort
	redir => l:StatusLineHi
		silent execute ('highlight StatusLine')
	redir END
	let l:fields = ['term', 'cterm', 'ctermfg', 'ctermbg', 'gui', 'guifg', 'guibg']
	let l:string = ''
	for i in [0, 1, 2, 3, 4, 5, 6]
		let l:matchGroup = matchstr(l:StatusLineHi, l:fields[i].'=\zs\S*')
		if !empty(l:matchGroup)
			" make StatusLineNC italic, so as to avoid filling a statusline with carets
			if i == 0 || i == 1 || i == 4
				execute ('highlight StatusLineNC ' . l:fields[i] . "=" .  l:matchGroup . ",italic ")
				let l:string .= l:fields[i] . "=" .  l:matchGroup . " "
			elseif i == 2
				let l:string .= l:fields[i] . "=" .  l:matchGroup . " "
			elseif i == 3
				let l:string .= l:fields[i] . "=203 "
			endif

			if has('gui')
				if i == 5
					let l:string .= l:fields[i] . "=" .  l:matchGroup . " "
				elseif  i == 6
					let l:string .= l:fields[i] . "=#c9666b"
				endif
			endif
		endif
	endfor
	execute ('highlight User1 ' . l:string)
endfunction

function! functions#formatGitgutterHunks() abort
	let l:hunks = GitGutterGetHunkSummary()
	let l:hunk_symbols = ['+', '~', '-']
	let l:string = ''
	if !empty(l:hunks)
		for i in [0, 1, 2]
			if (winwidth(0) > 100) || l:hunks[i] > 0
				if l:hunks[i] > 0
					let string .= printf('%s%s ', l:hunk_symbols[i], l:hunks[i])
				endif
			endif
		endfor
	endif
	return string
endfunction
