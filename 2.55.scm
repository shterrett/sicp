(car ''abracadabra)
; => quote
; ==> (car (quote (quote abracdabra)))
;
; the first quote is quoted, so rather than being evaluated
; it is printed as a literal 'quote'
