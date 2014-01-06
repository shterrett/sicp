(define (cont-frac-iter n d k)
  (define (iter num denom count)
    (if (= 0 count)
      (/ (n count) denom)
      (iter (n count) (+ (d count) (/ num denom)) (- count 1))))
  (iter (n k) (d k) k))

(define (n k) 1.0)

(define (d k)
  (if (= 0 (remainder (- k 1) 3))
      (* (+ (/ (- k 1) 3) 1) 2)
      1))

(+ 2 (cont-frac-iter n d 1000))
