(define (integers-from n)
  (cons-stream n (integers-from (+ 1 n))))

(define integers
  (integers-from 1))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
          (cons
            (head stream)
            (stream-section
              (- n 1)
              (tail stream))))))

(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (partial-sums s)
                            (stream-cdr s))))

(display (stream-section 10 (partial-sums integers)))
