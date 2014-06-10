; '(unless pred usual exceptional)

(define (unless? exp)
  (tagged-list? exp 'unless))

(define (unless-predicate exp)
  (cadr exp))

(define (unless-usual exp)
  (caddr exp))

(define (unless-exceptional exp)
  (cadddr exp))

(define (unless->if exp)
  (make-if (unless-predicate exp)
           (unless-exceptional exp)
           (unless-usual exp)))

; procedure vs special form
; The main difference is the ability to pass a procedure
; as an argument and return it as a result of a procedure. Unless
; is more valuable as a procedure in a circumstance where it
; is to be determined at runtime whether to use unless or not.
