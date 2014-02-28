(define (zero? n)
  (apply-generic 'zero? 'x))

(define (install-scheme-number-package)
  (put 'zero? '(n)
       (lambda (n) (= 0 n))))

(define (install-rational-package)
  (put 'zero? 'n
       (lambda (n)
         (= 0 (numer n)))))

(define (install-complex-package)
  (put 'zero? n
       (lambda (n)
         (= 0 (magnitude n)))))
