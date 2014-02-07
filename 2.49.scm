(define outline (list
                  (make-segment (make-vect 0 0)
                                (make-vect 0 1))
                  (make-segment (make-vect 0 1)
                                (make-vect 1 1))
                  (make-segment (make-vect 1 1)
                                (make-vect 1 0))
                  (make-segment (make-vect 1 0)
                                (make-vect 0 0))))

(define x (list
            (make-segment (make-vect 0 0)
                          (make-vect 1 1))
            (make-segment (make-vect 0 1)
                          (make-vect 1 0))))

(define diamond (list
                  (make-segment (make-vect 0.5 0)
                                (make-vect 1 0.5))
                  (make-segment (make-vect 1 0.5)
                                (make-vect 0.5 1))
                  (make-segment (make-vect 0.5 1)
                                (make-vect 0 0.5))
                  (make-segment (make-vect 0 0.5)
                                (make-vect 0.5 0))))

(define wave ; take a ruler. Measure all the verticies and divide
             ; by the width/height of the box to normalize to
             ; the unit square. list in sequence.)
