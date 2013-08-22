scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:inu_count = 0
let s:last_time = 0

function! airline#extensions#inu#update()
	let time = str2float(reltimestr(reltime()))
		let inu =[
	\      '     (U＾ω＾)                ',
	\      '    -(U＾ω＾)                ',
	\      '    -=(U＾ω＾)               ',
	\      '     -=(Uーωー)              ',
	\      '    -=≡(U＞ω＜) ｲﾇｩ…       ',
	\      '     --=≡(U＞ω＜) ｲﾇｩ…     ',
	\      '       --=≡(U＞ω＜) ｲﾇｩ…   ',
	\      '          -=≡(U＞ω＜) ｲﾇｩ… ',
	\      '             -=(Uーωー)      ',
	\      '             -=(U＾ω＾)      ',
	\      '              -(U＾ω＾)      ',
	\      '               (U＾ω＾)      ',
	\]
	if (time - s:last_time) > 0.45
		let s:inu_count += 1
		let s:last_time = time
	endif
	return inu[ s:inu_count % len(inu) ]
endfunction


function! airline#extensions#inu#init(...)
	let g:airline_section_c = g:airline_section_c .  ' %{airline#extensions#inu#update()}'
endfunction


augroup airline-inu
	autocmd!
	autocmd CursorHold  * call feedkeys("g\<ESC>", 'n')
	autocmd CursorHoldI  * call feedkeys("\<C-g>\<ESC>", 'n')
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
