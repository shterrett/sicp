(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(inc 3)

((double inc) 3)
(((double (double double)) inc) 5)
