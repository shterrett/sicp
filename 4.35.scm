(define (an-integer-between l h)
  (cond ((> l h) (amb))
        (else (amb l) (amb (an-integer-between (+ l 1) h)))))
