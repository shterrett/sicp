(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))

(define (simple-flatten stream)
  (stream-map (lambda (str)
                (stream-car str))
              (stream-filter (lambda (str)
                               (not (stream-null? str)))
                             stream)))

; This won't change the result; it's simply a less generic method
; of acheiving the same
