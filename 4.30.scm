;; a
;; Ben is right about for-each because eval is called on each
;; statement of the sequence individually. This ensures that
;; each statement will eventually be forced as it is
;; evaluated by eval.
;;
;; b
(define (p1 x)
  (set! x (cons x '(2)))
  x)

(define (p2 x)
  (define (p e)
    e
    x)
  (p (set! x (cons x '(2)))))

(p1 1)
(p2 1)

;; original eval-sequence
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (eval (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))
;; in procedure p2, e would not be forced because its result
;; is not used
;; (p1 1) -> (1 2)
;; (p2 1) -> 1
;;
;; Cy's eval-sequence
(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (actual-value (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))
;; Cy's eval sequence forces every expression in the list of
;; expressions, and would execute e in p2.
;; (p1 1) -> (1 2)
;; (p2 1) -> (1 2)
;;
;; c
;; for-each forces each of its expressions, so forcing the expressions
;; has no net effect (they're not thunks anymore, so they're
;; simply returned). It's essentially an idempotent operation
;;
;; d
;; I'm  not sure. The text's way seems dangerous because
;; certain side-effectful expressions may not be evaluated
;; however Cy's version seems to clobber some of the
;; usefulness of lazy evaluation in forcing an entire sequence
;; at once.
