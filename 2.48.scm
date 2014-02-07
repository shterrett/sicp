(define (make-segment start end)
  (cons start end))

(define (start segment)
  (car segment))

(define (end segment)
  (cdr segment))
