(define (make-sum a1 a2)
  (list a1 '+ a2))

(define (addend s)
  (car s))

(define (augend s)
  (caddr s))

(define (sum? e)
  (and (list? e) (eq? '+ (cadr e))))

(define s '(3 + 5))
(addend s)
(augend s)
(sum? s)

(define (make-product m1 m2)
  (list m1 '* m2))

(define (multiplier m)
  (car m))

(define (multiplicand m)
  (caddr m))

(define (multiplication? e)
  (and (list? e) (eq? '* (cadr e))))

(define m '(3 * 5))
(multiplier m)
(multiplicand m)
(multiplication? m)
