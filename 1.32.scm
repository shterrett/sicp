(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter operand result)
    (if (> operand b)
      result
      (iter (next operand) (combiner (term operand) result))))
  (iter a null-value))

(define (identity x) x)
(define (increment x)
  (+ x 1))

(accumulate * 1 identity 4 increment 6)
(accumulate-iter * 1 identity 4 increment 6)
