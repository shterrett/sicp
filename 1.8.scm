(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (cube guess) x))) 0.001))

(define (improve guess x)
  (/ ( + (* 2.0 guess)
         (/ x
            (square guess)))
     3))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
    guess
    (cubert-iter (improve guess x) x)))

(define (cubert x) (cubert-iter 1.0 x)))

(cubert 27)
