
function! InsertJinxTagHeader()
	let l:filename = expand("%:t")
	if empty(l:filename)
		let l:filename = "untitled"
	endif

	let l:user = "kappa <kapparovski-git@github>"
	let l:date = strftime("%Y/%m/%d %H:%M:%S")

	" Calibrated to exactly 80 characters per line
	let l:f_line = printf("/*   %-45s   | ||_ _|| \\ | |\\ \\/ /    */", l:filename)
	let l:u_line = printf("/*   By: %-41s|____||___||_|\\__|/_/\\_\\    */", l:user)
	let l:c_date = printf("/*   Created: %s by kappa            * ~ PowPow!! ~ *        */", l:date)
	let l:u_date = printf("/*   Updated: %s by kappa               \\   !!   /           */", l:date)

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
		let l:date = strftime("%Y/%m/%d %H:%M:%S")
		silent! 9substitute#^/\*   Updated: .\+ by kapparovski#\=printf("/*   Updated: %s by kapparovski", l:date)#e
		call setpos('.', l:save_cursor)
	endif
endfunction

autocmd BufWritePre *.c,*.h call UpdateJinxHeader()
