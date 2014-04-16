(define (show x)
  (newline)
  (display x)
  x)

(define (stream-enumerate-interval x y)
  (if (> x y)
    '()
    (cons-stream x (stream-enumerate-interval (+ x 1) y))))

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)
