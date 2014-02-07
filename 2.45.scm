(define (up-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (up-split painter (- n 1))))
      (below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (right-split painter (- n 1))))
      (beside painter (below smaller smaller)))))

(define (split primary secondary painter)
  (if (= n 0)
    painter
    (let ((smaller (split primary secondary painter (- n 1))))
      (primary painter (secondary smaller smaller)))))

(define (right-split painter) (split beside below painter))
(define (up-split painter) (split below beside painter))
