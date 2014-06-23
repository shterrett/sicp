; 2.18

(define (reverse list)
  (define (make-reverse forward-list reverse-list)
    (if (null? forward-list) reverse-list
      (make-reverse (cdr forward-list) (cons (car forward-list) reverse-list))))
  (make-reverse list '()))

; 4.68
(rule (reverse (?forward-first . ?forward-rest) ?reversed)
      (reverse ?forward-rest ?forward-rest-reversed)
      (append-to-form ?forward-rest-reversed ?forward-first ?reversed))

; The rule cannot answer (reverse ?x (1 2 3)) because it relies on
; being able to subdivide the first term and recurse with it.
