(define (map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (map proc (car tree))
                    (map proc (cdr tree))))))

(define (square x)
  (* x x))

(define test-list (list 1 2 (list 3 4) (list 5 (list 6) (list 7) (list 8 9)) 10))

(map square test-list)
