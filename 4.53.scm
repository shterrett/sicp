(let ((pairs '()))
  (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
             (permanent-set! pairs (cons p pairs))
             (amb))
           pairs))

; possible prime pairs:
; (3 20)
; (3 110)
; (8 35)
; prime-sum-pair and permanent-set will succeed
; it will output the result of (amb)
; which I believe is an error, because amb requires arguments.
