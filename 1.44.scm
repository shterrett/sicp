(define (smooth f)
  (define dx .001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f (x))
          (f (+ x dx)))
       3)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (repeated (compose f f) (- n 1))))

(define (f x)
  x)
(define n 10)

((repeated smooth n) f)
