; Louis' plan will think nearly every argument is an application and pass it directly to apply
; This is because it interprets any pair as an application, if it was not captured by any of the above
; clauses.
; (define x 3) will pass 'define as the procedure and x and 3 as the arguments to apply

(define (application? exp)
  (tagged-list? exp 'call))

(define (operator exp)
  (cadr exp))

(define (operands exp)
  (cddr exp))

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        .
        .
        .
        ((application? exp)
         (apply (eval (operator exp) env)
           (list-of-values (operands exp) env)))
        .
        .
        .
        ))
