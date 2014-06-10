; lazier lists allow simultaneous definition
; because arguments are not evaluated until needed
; therefore something like ex 3.77 is much easier


(define (integral delayed-integrand initial-value dt)
  (cons-stream initial-value
               (if (stream-null? integrand)
                 '()
                 (integral (stream-cdr integrand)
                           (+ (* dt (stream-car integrand))
                              initial-value)
                           dt))))
