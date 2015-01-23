filetype plugin indent on
syntax on
set number

" automagically remove trailing whitespace for certain files when saving
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
autocmd FileType c,cpp,php,html,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
