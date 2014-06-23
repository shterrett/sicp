(rule (last-pair (?x) (list ?x))
      (last-pair (?y . ?x) (list ?x)))

(last-pair (3) ?x)
; (last-pair (3) (3))

(last-pair (1 2 3) ?x)
; (last-pair (1 2 3) (3))

(last-pair (2 ?x) (3))
; (last-pair (2 3) (3))
