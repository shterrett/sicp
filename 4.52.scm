(define (if-fail? exp)
  (tagged-list? exp 'if-fail))

(define (if-fail-exp exp)
  (cadr exp))

(define (if-fail-failure exp)
  (caddr exp))

(define (analyze-if-fail exp)
  (let ((proc (if-fail-exp exp))
        (fallback (if-fail-failure exp)))
    (lambda (env succeed fail)
      (proc env
            succeed
            (lambda ()
              (fallback (env succeed fail)))))))
