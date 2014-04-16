; because guesses is defined in the body of sqrt-stream
; it can be memoized nd input directly in the lambda expression
; that calculates future terms. In Louis's version, the
; value is never stored, and can't be memoized/inserted; therefore
; sqrt-stream up to x has to be recalculated each time.
; This advantage would not be present if delay did not memoize.
