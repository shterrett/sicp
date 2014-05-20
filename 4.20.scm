(define (letrec->let let-exp)
  (let* ((vars (let-vars let-exp))
         (exps (let-exps let-exp)))
    (cons 'let
          (cons (map (lambda (var) (list var '*unassigned*)) vars)
                (append (map (lambda (var exp)
                               (set! var exp))
                             vars
                             exps)
                        (let-body let-exp))))))

; let, for f would have odd? undefined in the even? procedure, and vice-versa. define, because we implemented simulatenous definitions, will allow these to be defined.
