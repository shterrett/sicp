(define (cycle? l)
  (let ((traversed '()))
    (define (walk l)
      (cond ((eq? l '()) #f)
            ((includes? traversed (car l)))
            (else (append! (car l))
                  (walk (cdr l)))))
  (walk l)))

(define (includes? collection item)
  (cond ((eq? collection '()) #f)
        ((eq? (car collection) item) #t)
        (else (includes? (cdr collection) item))))
