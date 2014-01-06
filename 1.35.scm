(define (average a b)
  (/ (+ a b)
     2))

(define (fixed-point f first-guess tolerance)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (phi tolerance)
  (fixed-point (lambda (y) (average y (+ 1  (/ 1 y))))
               1.0
               tolerance))

(phi .0001)
