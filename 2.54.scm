(define (equal? first second)
  (cond ((null? first) #t)
        ((eq? (car first) (car second))
         (equal? (cdr first) (cdr second)))
        (else #f)))

(equal? '(a b c d) '(a b c d))
(equal? '(a (b c) d) '(a b c d))
