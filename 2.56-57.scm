(define (=number? var num)
  (and (number? var) (= var num)))

(define (variable? v)
  (symbol? v))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 . a2)
  (cond ((=number? a1 0) a2)
        ((=number? (car a2) 0) a1)
        ((and (number? a1) (number? (car a2))) (+ a1 (car a2)))
        (else (append (list '+ a1) a2))))

(define (sum? e)
  (and (pair? e) (eq? (car e) '+)))

(define (addend s) (cadr s))

(define (augend s)
  (let ((ex (cddr s)))
    (cond ((list? ex)
           (if (= (length ex) 1) (car ex)
             (cons '+ ex)))
          (else ex))))


(define (make-product m1 . m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (append (list '* m1) m2))))

(define (product? e)
  (and (pair? e) (eq? (car e) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p)
  (let ((ex (cddr p)))
    (cond ((list? ex)
           (if (= (length ex) 1) (car ex)
             (cons '* ex)))
          (else ex))))

(define (make-exponentiation b e)
  (cond ((=number? e 1) b)
        ((or (=number? e 0) (=number? b 1)) 1)
        ((=number? b 0) 0)
        ((and (number? e) (number? b)) (expt b e))
        (else ('** e b))))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (exponentiation? e)
  (and (symbol? (car e)) (eq? '** (car e))))

(define (deriv e var)
  (cond ((number? e) 0)
        ((variable? e)
         (if (same-variable? e var) 1 0))
        ((sum? e)
         (make-sum (deriv (addend e) var)
                   (deriv (augend e) var)))
        ((product? e)
         (make-sum
           (make-product (multiplier e)
                         (deriv (multiplicand e) var))
           (make-product (deriv (multiplier e) var)
                         (multiplicand e))))
        ((exponentiation? e)
         (make-product (make-product (exponent e)
                                     (make-exponentiation (base e)
                                                          (- (exponent e) 1)))
                       (deriv (base e) var)))
        (else
          (error "unknown expression type -- DERIV" e))))

(deriv 2 'x)
(deriv 'x 'x)
(deriv '(+ x 3) 'x)
(deriv '(+ x (* 2 x) 3) 'x)
(deriv '(+ x (* 2 x) (* 3 x)) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(** x 2) 'x)
(deriv '(* (* x y) (* 2 x) (+ x 3)) 'x)
