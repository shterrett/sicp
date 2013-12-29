(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even x) (= 0 (remainder x 2)))

(define (mult x y)
  (cond ((= y 1) x)
        ((even y) (mult (double x) (halve y)))
        (else (+ x (mult x (- y 1))))))

(mult 6 6)
