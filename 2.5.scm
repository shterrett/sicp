(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car c)
  (if (= 0 (remainder c 2)) (+ 1 (car (/ c 2)))
    0))

(define (cdr c)
  (if (= 0 (remainder c 3)) (+ 1 (cdr (/ c 3)))
    0))

(car (cons 2 3))
(cdr (cons 2 3))
