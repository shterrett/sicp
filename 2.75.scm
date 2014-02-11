(define (make-from-mag-ang r theta)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) theta)
          ((eq op 'real-part) (* r (cos theta)))
          ((eq op 'imaginary-part) (* r (sin theta)))
          (else
            (error "Unknown op -- MAKE-FROM-MAG-ANG" op)))))
