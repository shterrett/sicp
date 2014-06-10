(define (user-print object)
  (cond ((compound-procedure? object)
          (display (list 'compound-procedure
                         (procedure-parameters object)
                         (procedure-body object)
                         '<procedure-env>)))
        ((list? object) (display-list object))
        (else (display object))))

(define (display-list lazy-list)
  (display (list
             (car lazy-list)
             'promise
             (cadr lazy-list))))
