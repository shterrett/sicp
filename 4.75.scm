(define (negate operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (if (stream-null? (qeval (negated-query operands)
                               (singleton-stream frame)))
        (singleton-stream frame)
        the-empty-stream))
    frame-stream))

(define (unique-query exps)
  (car exps))

(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
    (lambda (frame)
      (stream-filter (lambda (str)
                       (< 2 (length str)))
                     (qeval (unique-query operands)
                            (singleton-stream frame))))
    frame-stream))
