(define (reverse list)
  (define (make-reverse forward-list reverse-list)
    (if (null? forward-list) reverse-list
      (make-reverse (cdr forward-list) (cons (car forward-list) reverse-list))))
  (make-reverse list '()))

(define test-list (list 1 2 3 4 5))
test-list

(reverse test-list)
