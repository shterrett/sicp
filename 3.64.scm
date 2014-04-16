(define (stream-limit stream tolerance)
  (if (< tolerance (- (stream-car stream) (stream-car (stream-cdr stream))))
    (stream-car (stream-cdr stream))
    (stream-limit (stream-cdr stream))))

