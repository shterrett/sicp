(define (make-accumulator total)
  (lambda (addend)
    (set! total (+ total addend))
    total))

(define A (make-accumulator 0))
(define B (make-accumulator 10))

(A 7)
(A 5)
(A 0)
(B 5)
(B 3)
