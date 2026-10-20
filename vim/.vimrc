
function! InsertJinxTagHeader()
	let l:filename = expand("%:t")
	if empty(l:filename)
		let l:filename = "untitled"
	endif

	let l:login = $USER
	let l:host = hostname()
	let l:user = l:login . " <" . l:login . "@" . l:host . ">"
	let l:date = strftime("%Y/%m/%d %H:%M:%S")

	" Calibrated to exactly 80 characters per line
	let l:f_line = printf("/*   %-45s   | ||_ _|| \\ | |\\ \\/ /    */", l:filename)
	let l:u_line = printf("/*   By: %-41s|____||___||_|\\__|/_/\\_\\    */", l:user)
	let l:c_date = printf("/*   Created: %s by %-17s* ~ PowPow!! ~ *        */", l:date, l:login)
	let l:u_date = printf("/*   Updated: %s by %-17s   \\   !!   /           */", l:date, l:login)

	let l:header = [
	    \ "/* ************************************************************************** */",
	    \ "/*									      */",
	    \ "/*						      _  ___  _   _ __  __    */",
	    \ l:f_line,
	    \ "/*						   _ | | | | |  \\| | >  <     */",
	    \ l:u_line,
	    \ "/*					         ~~~~~~~~~~~~~~~~~~~~~~~~~    */",
	    \ l:c_date,
	    \ l:u_date,
	    \ "/*									      */",
	    \ "/* ************************************************************************** */",
	    \ ""
	    \ ]

	call append(0, l:header)
endfunction

" Press F1 in Normal mode to insert the header
nnoremap <F1> :call InsertJinxTagHeader()<CR>

" Automatically refresh the Updated timestamp on save
function! UpdateJinxHeader()
	if line("$") >= 9
		let l:save_cursor = getpos(".")
		let l:date = strftime("%Y/%m/%d %H:%M:%S")i
		let l:login = $USER
		silent! 9substitute#^/\*   Updated: .\+\* ~#/*   Updated:#e
		silent! execute '9s#^/\*   Updated: [0-9/: ]\+ by \S\+#\=printf("/*   Updated: %s by %-17s", l:date, l:login)#e'
		call setpos('.', l:save_cursor)
	endif
endfunction

autocmd BufWritePre *.c,*.h call UpdateJinxHeader()
