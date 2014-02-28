(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))
  dispatch)

; GLOBAL
;   make-account = procedure
;   (define acct (make-account 50))
;   E1
;     acct = procedure
;     balance = 50
;     ((acct 'deposit) 40)
;     E2
;     balance = 90
;     ((acct 'withdraw) 50)
;     E3
;     balance = 40
