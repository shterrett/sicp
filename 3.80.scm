(define (RLC R L C dt)
  (lambda (vc0 iL0)
    (define (iL (delay (integral (force diL) iL0 dt))))
    (define (diL (delay (+ (scale-stream (force iL) (/ (- R) L))
                           (scale-stream (force vC) (/ 1 L))))))
    (define (vC (delay (integral (force dvC) vC0 dt))))
    (define (dvC (delay (scale-stream (force iL) (/ (- 1) C)))))
    (cons (force vC) (force iL))))

