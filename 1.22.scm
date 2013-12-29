(define (report-prime elapsed-time)
  (newline)
  (display "***")
  (newline)
  (display elapsed-time))


(define (prime? n)
  (fast-prime? n 10))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base ex m)
  (cond ((= ex 0) 1)
        ((even? ex)
         (remainder (square (expmod base (/ ex 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- ex 1) m))
                     m))))

(define (search-for-primes n start-time)
  (define (find-primes x times)
    (cond ((= 0 times) (report-prime (- (runtime) start-time)))
          ((prime? x)
           (newline)
           (display x)
           (find-primes (+ 1 x) (- times 1)))
          (else (find-primes (+ 1 x) times))))
  (find-primes n 3))

(search-for-primes 1000 (runtime))
