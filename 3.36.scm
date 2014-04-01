;          |               Global Env                    |
;                            /\
;                           /  \
;                          /    \
;                         /      \
;                        a        b
;                        |
;                        |
;                   (set-value a)
;                        |
;                        |
;                   for-each-except
;
;
; for-each-except is run in the context of setting the value of a
; the variables use are from the (make-connector) construction for a, and
; are wholly independant of those from the construction of b.
