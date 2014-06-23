(rule (wheel ?person)
      (and (supervisor ?middle-manager ?person)
           (supervisor ?x ?middle-manager)))

; Oliver Warbucks is listed 4 times because there are four different
; combinations of people who satisy the condition
; (and (supervisor ?middle-manager (Warbucks Oliver))
;      (supervisor ?x ?middle-manager))
;
; This is due to some combination of Oliver supervising multiple people,
; and each of those that he supervises supervising many people.
