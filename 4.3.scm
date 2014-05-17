(define (eval exp)
  (cond ((self-evaluating? exp) identity)
        ((variable? exp) lookup-variable-value)
        ((quoted? exp) text-of-quotation)
        ((assignmnent? exp) eval-assignment)
        ((definition? exp) eval-definition)
        ((if? exp) eval-if)
        ((lambda? exp) eval-lambda)
        ((begin? exp) eval-begin)
        ((cond? exp) eval-if)
        ((application? exp) eval-application)
        (else
          (error "Unknown expression type -- EVAL" exp))))

(define (identity x) x)

(define (eval-lambda exp env)
  (make-procedure (lambda-parameters exp) 
                  (lambda-body exp)
                  env))

(define (eval-begin exp env)
  (eval-sequence (begin-actions exp) env))

(define (eval-if exp env)
  (eval (cond->if exp) env))

(define (eval-application exp env)
  (apply (eval (operator exp) env)
         (list-of-values (operands exp) env)))
