(define (for-each proc lst)
  (cond ((null? lst) #t)
        ((proc (car lst))
         (for-each proc (cdr lst)))))

(define (pp x)
  (newline)
  (display x))

(for-each pp (list 1 2 3 4 5))
