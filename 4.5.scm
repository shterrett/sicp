(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
    'false
    (let ((first (car clauses))
          (rest (cdr clauses)))
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "ELSE clause isn't last -- COND->IF"
                 clauses))
        (make-if (cond-predicate first)
                 (sequence->exp (cond-actions first (cond-predicate first)))
                 (expand-clauses rest))))))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (cond-actions clause predicate)
  (if (equal? (car clause) '=>)
    ((lambda (x) (cdr clause)) predicate)
    (cdr clause)))
