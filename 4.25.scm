(define (unless pred usual exceptional)
  (if predicate exceptional usual))

(define (factorial n)
  (unless (= n 1)
    (* n (factorial (- n 1)))
    1))

; in applicative order scheme, both arguments to unless will be evaluated
; before unless is evaluated. This will cause the program to never terminate
; because factorial will be called every time.
;
; in normal order scheme, the arguments are not evaulated until needed.
; Therefore, if (= n 1), the exceptional case will be called and evaluated
; but the usual case will not. This will prevent factorial from being called
; and infinite number of times.
