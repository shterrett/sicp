; before the distinct requirement is applied, there are 5^5 possible
; assignments.
; after the distinct requirement is applied, there are 5! possible
; assignments.

(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (let ((fletcher (amb 1 2 3 4 5)))
      (require (not (= fletcher 5)))
      (require (not (= fletcher 1)))
      (let ((cooper (amb 1 2 3 4 5))
            (smith (amb 1 2 3 4 5))
            (miller (amb 1 2 3 4 5)))
        (require (not (= cooper 1)))
        (require (not (= (abs (- fletcher cooper)) 1)))
        (require (not (= (abs (- smith fletcher)) 1)))
        (require (> miller cooper))
        (require (distinct? (list baker cooper fletcher miller smith)))
        (list (list 'baker baker)
              (list 'cooper cooper)
              (list 'fletcher letcher)
              (list 'miller miller)
              (list 'smith smith))))))
