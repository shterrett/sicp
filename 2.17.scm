(define (last-pair list)
  (if (null? (cdr list)) list
    (last-pair (cdr list))))

(define test-list (list 1 2 3 4 5))

(last-pair test-list)
