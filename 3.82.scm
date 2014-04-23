(define (random-points x-min x-max y-min y-max)
  (cons-stream (cons (+ x-min (random x-max))
                     (+ y-min (random y-max)))
                 (random-points x-min x-max y-min y-max)))

(define (circle-area-test point)
  (let ((x (car point))
        (y (cdr point)))
    (<= 9 (+ (expt (- x 5) 2) (expt (- y 7) 2)))))

(define (monte-carlo experiment value-stream)
  (cond
    ((experiment (stream-car value-stream))
     (cons-stream 1 (monte-carlo experiment (stream-cdr value-stream))))
    (else
      (cons-stream 0 (monte-carlo experiment (stream-cdr value-stream))))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define random-values (random-points x1 x2 y1 y2))
  (define results (monte-carlo P random-values))
  (define (iter pass total next-results)
    (cond ((= total trials)
           (/ pass total))
          ((= 1 (stream-car next-results))
           (iter (+ 1 pass) (+ 1 total) (stream-cdr next-results)))
          ((= 0 (stream-car next-results))
           (iter pass (+ 1 total) (stream-cdr next-results)))))
  (* (iter 0 0 results) (* (- x2 x1) (- y2 y1))))

(estimate-integral circle-area-test 2 8 4 10 100)
