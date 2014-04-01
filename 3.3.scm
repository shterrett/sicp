(define (make-account balance secret)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m password)
    (if (eq? password secret)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m)))
      (error "Bad Password" password)))
  dispatch)

(define acct (make-account 100 'password))
((acct 'deposit 'password) 25)
((acct 'deposit 'not-password) 25)