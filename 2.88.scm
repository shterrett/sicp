(define (subtract-polynomials p1 p2)
  (add p1 (negate-polynomial p2)))

(define (negate-polynomial p)
  (if (empty-termlist? (first-term p)) the-empty-termlist
    (adjoin-term (make-term (mult -1 (first-term p))))))
