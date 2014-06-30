; the (save val) at the end of afterfib-n-1 and the
; (restore val) at the end beginning of afterfib-n-2
; both are using the same 'value' of val (Fib(n-1))
; Therefore, they can be eliminated and val can simply
; persist Fib(n-1) across between the two sections
