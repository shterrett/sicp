(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even x ) (= 0 (remainder x 2)))

(define (mult-iter x y a)
  (cond ((= y 0) a)
        ((even y) (mult-iter (double x) (halve y) a))
        (else (mult-iter x (- y 1) (+ a x)))))

(define (mult x y)
  (if (= y 1) x (mult-iter x y 0)))

(mult 6 6)
