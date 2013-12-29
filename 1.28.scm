(define (expmod base ex m)
  (cond ((= ex 0) 1)
        ((even? ex)
         (remainder (square (expmod base (/ ex 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- ex 1) m))
                     m))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (special-number n exemplar)
    (and (= (square n) 1)
         (or (= n 1) (= n exemplar))))

(define (mr-test n)
  (define (try-it a)
    (special-number (expmod a (- n 1) n) n))
  (try-it (+ 1 (random (- n 1)))))


(fast-prime? 7 10)
(fast-prime? 561 10)
(fast-prime? 1009 10)
