(define (same-parity i . rest)
  (define (parity-filter fn full-list)
    (define (build-list old new)
      (cond ((null? old) new)
            ((fn (car old)) (build-list (cdr old) (append new (list (car old)))))
            ((build-list (cdr old) new))))
    (build-list full-list '()))
  (if (even? i) (parity-filter even? (cons i rest))
    (parity-filter odd? (cons i rest))))

(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6)
