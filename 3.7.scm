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
              ((eq? m 'share)
               (lambda (new-password)
                 (lambda (op shared-password)
                   (if (eq? new-password shared-password)
                     (dispatch op secret)
                     (error "Bad Password" password)))))
              (else (error "Unknown request -- MAKE-ACCOUNT" m)))
        (error "Bad Password" password)))
  dispatch)

(define (make-joint acct password new-password)
  ((acct 'share password) new-password))

(define acct (make-account 100 'password))
(define shared-acct (make-joint acct 'password 'new-password))
((shared-acct 'deposit 'new-password) 25)
((acct 'withdraw 'password) 25)