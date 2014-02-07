(define (fringe tree)
  (define (add-leaves tree results)
    (cond ((null? tree) results)
          ((list? (car tree)) (add-leaves (cdr tree)
                                          (append (add-leaves
                                                    (car tree)
                                                    results))))
          (else (add-leaves (cdr tree)
                            (append results
                                    (list (car tree)))))))
  (add-leaves tree '()))

(define x (list 1 2 (list 3 4)))
(define y (list 5 (list 6 7) 8))
(fringe x)
(fringe y)
