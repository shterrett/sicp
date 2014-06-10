(define (can-attack queen queens)
  (


(define (eight-queens)
  (let ((range (list 1 2 3 4 5 6 7 8)))
    (let ((q1 (list (amb range) (amb range)))
          (q3 (list (amb range) (amb range)))
          (q4 (list (amb range) (amb range)))
          (q5 (list (amb range) (amb range)))
          (q6 (list (amb range) (amb range)))
          (q7 (list (amb range) (amb range)))
          (q8 (list (amb range) (amb range))))
      (let ((queens (list q1 q2 q3 q4 q5 q6 q7 q8)))
        (require (= (length queens) (unique-length (map car queens))))
        (require (= (length queens) (unique-length (map cadr queens))))
        (require (not (any (map (lambda (x)
                                  (diagonal-intersect x queens))
                                queens))))))))
