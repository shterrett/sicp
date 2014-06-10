(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (permutations s)
  (if (null? s)
    '()
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove x s))))
             s)))

(define (filter predicate options)
  (cons ((null? options) '())
        ((predicate (car options)) (cons (car options) (filter predicate (cdr options))))
        (else (filter predicate (cdr options)))))

(define (baker l) (car l))

(define (cooper l) (cadr l))

(define (fletcher l) (caddr l))

(define (miller l) (cadddr l))

(define (smith l) (cadddr l))

(define (allowable? s)
  (and
    (not (= (baker s) 5))
    (not (= (cooper s) 1))
    (not (= (fletcher s) 5))
    (not (= (fletcher s) 1))
    (> miller cooper)
    (not (= (abs (- smith fletcher)) 1))
    (not (= (abs (- fletcher cooper)) 1))))

(filter allowable? (permutations 1 2 3 4 5))
