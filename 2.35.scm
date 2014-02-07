(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
     (cond ((null? tree) '())
           ((not (pair? tree)) (list tree))
           (else (append (enumerate-tree (car tree))
                         (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1)(enumerate-tree t))))

(define test-list (list 1 2 3 4 5))
(define test-tree (list 1 (list 2 3) (list 4 (list 5 6))))

(count-leaves test-list)
(count-leaves test-tree)
