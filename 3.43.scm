; if the exchanges are run sequentially, the total
; money must stay constant because addition is commutative.
; Additionally, because the balances are being exchanged, and not
; changed by an arbitrary amount, they must all stay the same (though
; they will have moved)
;
; If the exchanges are run concurrently and there is no lock
; for access, then the results are indeterminated because access
; may occur in the middle of another operation.
