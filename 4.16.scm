(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (let (value (car vals))
               (if (equal? value '*unassigned*)
                 (error "Unassigned Variable" var)
                 value)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
      (error "Unbound variable" var)
      (let ((frame (first-frame env)))
        (scan (frame-variables frame)
              (frame-values frame)))))
  (env-loop env))

(define (scan-out-defines body)
  (let* ((definitions (filter definition? body))
         (rest-expressions (filter (lambda (expr) (not (definition? expr))) body))
         (vars (map definition-variable definitions))
         (vals (map definition-value definitions)))
    (define (make-unassigned-binding var)
      (list var '*unassigned*))
    (define (make-assignment var val)
      (list 'set! var val))
    (append (list 'let
                  (map make-unassigned-binding vars))
            (map make-assignment vars vals)
            rest-expressions)))

(define (make-procedure parameters body env)
  (list ('procedure
         parameters
         (scan-out-defines body)
         env)))

; make-procedure is preferrable because it will be called exactly
; once for each procedure. procedure-body can be called multiple times
