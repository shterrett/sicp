; SICP
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (eval (first-operand exps) env)
          (list-of-values (rest-operands exps) env))))

; Left to Right
(define (list-of-values-l exps env)
  (if (no-operands? exps)
    '()
    (let ((first-value (eval (first-operand exps) env)))
      (cons first-value
            (list-of-values-l (rest-operands exps) env)))))

; Right to Left
(define (list-of-values-r exps env)
  (if (no-operands? exps)
    '()
    (let ((first-value (list-of-values-r (rest-operands exps) env)))
      (cons (eval (first-operand exps) env)
            (first-value)))))
