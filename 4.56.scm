; names and addresses of people supervised by Ben Bitdiddle
(and (supervisor (Bitdiddle Ben) ?name)
     (address ?name ?location))

; people who's salary is less than Ben Bitdiddle's salary
(and (salary (Bitdiddle Ben) ?salary)
     (salary ?person ?other-salary)
     (lisp-value < ?other-salary ?salary))

; people supervised by someone not in computing
(and (job ?supervisor (?division . ?title))
     (not (job ?supervisor (computer . ?title)))
     (supervisor ?supervisor ?person))
