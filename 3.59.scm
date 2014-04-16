(define (integers-from n)
  (cons-stream n (integers-from (+ 1 n))))

(define integers
  (integers-from 1))

(define (mult-streams s1 s2)
  (stream-map * s1 s2))

(define (scale-series n series)
  (map-stream * n series))

(define (integrate series)
  (cons-stream (stream-car series)
               (mult-streams (map (lambda (x) (/ 1 x)) integers)
                             series)))

(define cosine-series
  (cons-stream 1 (integrate (scale-series -1 sine-series))))

(define sine-series
  (cons-stream 0 (integrate cosine-series)))
