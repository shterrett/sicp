(define (print-rat x)
  (newline)
  (display (num x))
  (display "/")
  (display (denom x)))

(define (num x)
  (car x))

(define (denom x)
  (cdr x))

(define (make-rat n d)
  (define (negative n d)
    (if (> 0 (* n d))
      true
      false))
  (define (make-negative rat)
    (cons (* -1 (num rat)) (denom rat)))
  (define (base-rat n d)
    (cons (abs n) (abs d)))
  (if (negative n d)
    (make-negative (base-rat n d))
    (base-rat n d)))

(print-rat (make-rat 1 2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat -1 -2))
