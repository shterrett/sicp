(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mult-streams s1 s2)
  (stream-map * s1 s2))

(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
          (cons
            (head stream)
            (stream-section
              (- n 1)
              (tail stream))))))

(define (integers-from n)
  (cons-stream n (integers-from (+ 1 n))))

(define integers
  (integers-from 1))

(define facts
  (cons-stream 1
               (mult-streams integers facts)))

; 1 1 2 6 24 120 ...

(display (stream-section 10 facts))
