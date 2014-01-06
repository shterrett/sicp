(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (repeated (compose f f) (- n 1))))

(define (average f)
  (lambda (x)
    (/ (+ x f)
     2)))

(define (nth-average a b n)
  ((repeated (average a) n) b))


(define (fixed-point f first-guess tolerance)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (newline)
    (display guess)
    (newline)
    (display count)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next (+ 1 count)))))
  (try first-guess 0))

(define (root x n)
  (define (f x y)
    (/ x (expt y (- n 1))))
  (fixed-point (lambda (y) (nth-average  y (f x y) 3))
               1.0
               .0001))

(root 1073741824 30)
(expt 2 30)
