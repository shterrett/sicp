; cons adds the item to the front of the list
; switching the arguments to cons nests the lists instead of joining them
; to make the process iterative, use appends. However, this may be recursive under the hood.
;
(define (square-list items)
  (define (square x)
    (* x x))
  (define (iter things answer)
    (if (null? things) answer
      (iter (cdr things)
            (append answer (list (square (car things))))))))

(square-list (list 1 2 3 4 5))
