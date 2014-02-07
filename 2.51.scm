(define (below painter-bottom painter-top)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
            (transform-painter painter-bottom
                               (make-vect 0.0 0.0)
                               split-point
                               (make-vect 0.0 1.0)))
          (paint-top
            (transfrom-painter painter-top
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

(define (below painter-bottom painter-top)
  (rotate-90
    (beside
      (rotate-270 painter-bottom)
      (rotate-270 painter-top))))
