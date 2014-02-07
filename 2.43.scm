; original
(flatmap
  (lambda (rest-of-queens)
    (map (lambda (new-row)
           (adjoin-position new-row k rest-of-queens))
         (enumerate-interval 1 board-size)))
  (queen-cols (- k 1)))

; altered
(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
           (adjoin-position new-row k rest-of-queens))
         (queen-cols (- k 1))))
  (enumerate-interval 1 board-size))

; Because queen-cols in inside the map instead of being called directly
; the program is no longer tail recursive
; this alters the program from one that runs in linear time to one that runs
; in exponential time.
; original T
; new T^n
