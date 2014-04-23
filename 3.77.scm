(define (integral delayed-integrand initial-value dt)
  (cons-stream initial-value
               (if (stream-null? (force integrand))
                 '()
                 (integral (delay (stream-cdr (force integrand)))
                           (+ (* dt (delay (stream-car (force integrand))))
                              initial-value)
                           dt))))
