(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (try guess)
      (if (good-enough? guess)
        guess
        (try (improve guess))))
    (try guess)))

(define (sqrt-improve x)
  (lambda (guess)
    (/ (+ guess (/ x guess)) 2.0)))

(define (sqrt-good-enough? x)
  (lambda (guess)
    (> .001 (abs (- (* guess guess) x)))))

(define (sqrt x)
  ((iterative-improve (sqrt-good-enough? x) (sqrt-improve x)) 2.0))

(sqrt 9)

(define (fixed-point-improve f)
  (lambda (guess)
    (f guess)))

(define (fixed-point-good-enough? f)
  (lambda (guess)
    (< (abs (- (f guess) (f ((fixed-point-improve f) guess))))
       .0001)))

(define (fixed-point f)
  ((iterative-improve (fixed-point-good-enough? f) (fixed-point-improve f)) 1.0))

(fixed-point cos)
