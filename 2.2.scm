(define (make-segment p1 p2)
  (cons p1 p2))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint segment)
  (define (average i j)
    (/ (+ i j) 2))
  (make-point (average (x-point (car segment))
                       (x-point (cdr segment)))
              (average (y-point (car segment))
                       (y-point (cdr segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint (make-segment (make-point 1 1)
                                     (make-point 3 3))))
