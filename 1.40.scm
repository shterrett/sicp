(define (average a b)
  (/ (+ a b)
     2))

(define (fixed-point f first-guess tolerance)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (deriv g)
  (define dx .00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess .001))

(define (cubic a b c)
  (define (cube x)
    (* x x x))
  (define (square x)
    (* x x))
  (lambda (x)
    (+  (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 1 1 1) 1)
