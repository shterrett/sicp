(define (equ? x y)
  (apply-generic 'equ? x y))

(define (install-scheme-number-package)
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y))))

(define (install-rational-package)
  (put 'equ? '(rat rat)
       (lambda (x y)
         (and (= (numer x) (numer y))
              (= (denom x) (denom y))))))

(define (install-complex-package)
  (put 'equ? '(complex complex)
       (lambda (x y)
         (and (= (real-part x) (real-part y))
              (= (imag-part x) (imag-part y))))))

; The rest of the install package has been ommitted
; because I don't need that much typing practice.
