(define (eval-let exp env)
  ((make-lambda let-vars let-body) let-exps))

(define (let*->nested-lets exp)
  (define (make-nested-lets vars exps body)
    (if (null? vars) body
      ((make-lambda (car vars)
                   (make-nested-lets (cdr vars)
                                     (cdr exps)
                                     body))
       (car exps)))))
