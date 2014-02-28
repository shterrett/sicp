(define (raise n)
  (apply-generic 'raise n))

(define (install-scheme-number-package)
  (put 'raise 'n
       (lambda (n) (make-rat n 1))))

(define (install rational-package)
  (put 'raise 'n
       (lambda (n) (make-from-real-imag n 0))))
