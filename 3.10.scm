(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Not enough minerals"))))


; GLOBAL
;  make-withdraw = procedure
;   (define acct (make-withdraw 100))
;     E1
;       initial-amount = 100
;       E2
;         balance = 100
;         acct = (lambda (amount)
;                  (if (>= 100 amount)
;                    (begin (set! balance (- 100 amount))
;                           balance)
;                    "Not enough minerals"))
;       (acct 50)
;         E3
;           amount = 50
;           acct = (lambda (50)
;                    (if (>= 100 50)
;                      (begin (set! balance 50)
;                             50)
;                      "Not enough minerals"))
;                => 50
