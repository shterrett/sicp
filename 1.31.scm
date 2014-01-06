(define (identity x) x)
(define (increment x)
  (+ x 1))

(define (prod term a next b)
  (if (> a b)
    1
    (* (term a) (prod term (next a) next b))))

(define (factorial x)
  (prod identity 1 increment x))

(define (prod-iter term a next b)
  (define (iter multiplicand result)
    (if (> multiplicand b)
      result
      (iter (next multiplicand)
            (* result (term multiplicand)))))
  (iter a 1))

(define (factorial-iter x)
  (prod-iter identity 1 increment x))

(factorial 5)
(factorial-iter 5)

(define (square x)
  (* x x))

(define (plus-2 x)
  (+ 2 x))

(* 8.0 (/ (prod square 4.0 plus-2 99.0)
        (prod square 3.0 plus-2 100.0)))
