; All the differentiation rules were abstracted away into the 'deriv call
; each operator will be used to lookup the associated method for the
; differentiation of its operands.
; Number and variable can't be placed into this scheme as well
; because there is no operator acting on those expressions.

; the procedures for the derivatives of sums and products are almost
; identical to the procedures in Section 2.3.2, except that they take the two
; operands instead of the entire expression, and are
; extracted as seperate procedures.
; this assumes all other handlers are defined as in 2.3.2

(define (install-derivatives)
  (define (diff-sum left right var)
    (make-sum (deriv left var)
              (deriv right  var)))

  (define (diff-prod left right var)
    (make-sum
      (make-product left
                    (deriv right var))
      (make-product (deriv left var)
                    right)))
  (define (diff-exp base ex var)
    (make-product (make-product ex
                                (make-exponentiation base
                                                     (- ex 1)))))

  (put 'deriv '+ diff-sum)
  (put 'deriv '* diff-prod)
  (put 'deriv '** diff-exp))

; if the put/get order was reversed, a different procedure for every binary
; combination of operators would be required, and the system designer would
; be shot.

