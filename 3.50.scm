(define (stream-map proc . streams)
  (if (stream-null? (car streams))
    '()
    (cons-stream
      (apply proc (map stream-car streams))
      (apply stream-map
             (cons proc (map stream-cdr streams))))))

(define (numbers)
  (define (integers-from n)
    (cons-stream n (integers-from (+ n 1))))
  (integers-from 1))

(define (even-numbers)
  (define (integers-by-two-from n)
    (cons-stream n (integers-by-two-from (+ n 2))))
  (integers-by-two-from 2))

(stream-map + (numbers) (even-numbers))
