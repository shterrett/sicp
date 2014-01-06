(define (cont-frac n d k)
  (if (= 0 k)
    0
    (/ (n k) ( + (d k) (cont-frac n d (- k 1))))))

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100))

(define (cont-frac-iter n d k)
  (define (iter num denom count)
    (if (= 0 count)
      (/ (n count) denom)
      (iter (n count) (+ (d count) (/ num denom)) (- count 1))))
  (iter (n k) (d k) k))

(/ 1 (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100))
