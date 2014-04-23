(define (make-zero-crossings input-stream last-value)
  (cons-stream
    (sign-change-detector (stream-car input-stream) last-value)
    (make-zero-crossings (stream-cdr input-stream)
                         (stream-car input-stream))))

(define zero-crossings
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))
