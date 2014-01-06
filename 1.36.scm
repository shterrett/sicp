(define (average a b)
  (/ (+ a b)
     2))

(define (fixed-point f first-guess tolerance)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (newline)
    (display guess)
    (newline)
    (display count)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next (+ 1 count)))))
  (try first-guess 0))

(define (exp-x tolerance)
  (fixed-point (lambda (y) (average y
                                    (/ (log 1000) (log y))))
               2.0
               tolerance))

(exp-x .001)
