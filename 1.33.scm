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

(define (prime x)
  (fast-prime? x 10))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (filter-accumulate combiner null-value term a next b fltr)
  (cond ((> a b) null-value)
        ((fltr a) (combiner (term a)
                            (filter-accumulate combiner null-value term (next a) next b fltr)))
        (else (filter-accumulate combiner null-value term a next b fltr))))

(define (increment x)
  (+ x 1))
(define (square x)
  (* x x))

(define (sum-sq-primes a b)
  (filter-accumulate + 0 square a increment b prime))

(sum-sq-primes 3 5)

(define (relative-prime a)
  (= 1 (gcd a 15)))

(define (identity x) x)

(filter-accumulate + 0 identity 1 increment 15 relative-prime)
