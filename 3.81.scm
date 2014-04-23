(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
          (cons
            (head stream)
            (stream-section
              (- n 1)
              (tail stream))))))

(define (rand seed)
  (define (rand-update x)
    (modulo (+ (* x 5) 3) 7))
  (let ((new-rand (rand-update seed)))
    (cons-stream new-rand
                 (rand new-rand))))

(display (stream-section 10 (rand 1)))
(display (stream-section 10 (rand 5)))
(display (stream-section 10 (rand 1)))
