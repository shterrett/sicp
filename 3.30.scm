(define (ripple-carry-adder As Bs Ss C)
  (cond ((eq? (car As) '()) 'ok)
        (else
          (let ((c-out (make-wire)))
            (full-adder (car As) (car Bs) C (car Ss) c-out)
            (triple-carry-adder (cdr As) (cdr Bs) (cdr Ss) c-out)))))
