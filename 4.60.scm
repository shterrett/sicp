; It happens because order is significant given the way the query is formulated
; All that is required is that ?person-1 and ?person-2 be different;
; That is satisfied in two different orders for any two people

; To ensure only one result for each pair of people, enfore order:
(and (lives-near ?person-1 ?person-2)
     (string<? (car ?person-1)
               (car ?person-2)))
