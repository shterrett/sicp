; If the operation is tried for the case where
; all arguments are coerced into each of the types
; of the arguments, the case in which the operation is
; defined for a common supertype that is not represented
; in the arguments list will fail unnecessarilily.
;
; For instance (+ complex irrational integer) if plus is only
; defined for reals, will fail.
