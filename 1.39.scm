(define (cont-frac-iter n d k)
  (define (iter num denom count)
    (if (= 0 count)
      (/ (n count) denom)
      (iter (n count) (+ (d count) (/ num denom)) (- count 1))))
  (iter (n k) (d k) k))

(define (tan x k)
  (define (n i)
    (expt x (+ 1 i)))
  (define (d i)
    (+ (* 2 i) 1))
  (cont-frac-iter n d k))

(tan .25 100)
