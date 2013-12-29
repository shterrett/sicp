(define (square x) (* x x))
(define (even x) (= 0 (remainder x 2)))

(define (fe-iter b n a)
  (cond ((= n 0) a)
        ((even n) (fe-iter (square b) (/ n 2) a))
        (else (fe-iter b (- n 1) (* a b)))))

(define (fast-exp b n)
  (if (= n 0) b
    (fe-iter b n 1)))

(fast-exp 6 6)
(expt 6 6)
