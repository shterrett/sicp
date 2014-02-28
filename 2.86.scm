; will have to extend make-from-real-imag and
; make-from-mag-ang to take numbers of all types,
; calling the pre-existing constructors for those numbers
; The selectors will then have to call apply-generic
; when retreiving magnitude, angle, real, and imaginary
; Finally, a generic sine and cosine function will have
; to be created for each of the number types and 
; installed in the function table.
