(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
    (iter trials 0))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define integral-test
    (lambda ()
      (let ((x (random-in-range x1 x2))
            (y (random-in-range y1 y2)))
        (P x y))))
  (let ((area (* (- x2 x1) (- y2 y1)))
        (trials-passed (monte-carlo trials integral-test)))
    (* area trials-passed)))

(define (circle-area-test x y)
  (<= 9 (+ (expt (- x 5) 2) (expt (- y 7) 2))))

(estimate-integral circle-area-test 2 8 4 10 100)
