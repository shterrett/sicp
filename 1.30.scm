(define (sum term a next b)
  (define (iter addend result)
    (if (> addend b)
      result
      (iter (next addend) (+ result (term addend)))))
  (iter a 0))

(define (identity x) x)
(define (increment x)
  (+ x 1))

(sum identity 7 increment 10)

(define (cube x)
  (* x x x))

(sum cube 1 increment 10)
