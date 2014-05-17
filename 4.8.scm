(define (named-let? exp)
  (variable? (cadr exp)))

(define (named-let-name exp) (cadr exp))
(define (named-let-assignment exp) (caddr exp))
(define (named-let-body exp))

(define (transform-named-let exp)
  (sequence->exp
    (list (cons 'define
                (cons (cons name (let-var assignment))
                      body))
          (cons name (let-exp assignment)))))
